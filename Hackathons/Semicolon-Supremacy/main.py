import datetime as dt
import pandas as pd
import tkinter as tk
from tkinter import ttk
import os

class classrooms:
    def __init__(self, name):
        self.name = name
        self.students = pd.DataFrame(columns=["id", "name"])
    
    def add_student(self, info):
        if self.students.shape[1] > len(info):
            info += [0]*(self.students.shape[1]-len(info))
        self.students.loc[len(self.students)] = info
        self.students.to_csv(f"data\{self.name}.csv", index=False)
   
    def remove_student(self, name):
        print(self.students)
        self.students.drop(self.students.index[self.students["name"] == name], axis=0, inplace = True)      
        self.students.to_csv(f"data\{self.name}.csv", index=False)
    
    def take_attendance(self, name=None):
        date = dt.datetime.now().strftime("%Y-%m-%d") #if you want to test add: %H:%M:%S
        last = str(self.students.columns.values[-1])
        if last == "name" or date > last:
            self.students[f"{date}"] = [1] * len(self.students)
        if name != "None":
            self.students[f"{date}"][self.students['name'] == name] = 0
        self.students.to_csv(f"data\{self.name}.csv", index=False)

class schools:
    def __init__(self):
        self.classes = []
        self.names = []
        
        if not(os.path.isdir('data')):
            os.mkdir('data')
        
        for filename in os.listdir("data"):
                df = pd.read_csv(f'data\{filename}')
                name = os.path.splitext(filename)[0]
                self.names.append(name)
                a = classrooms(name)
                a.students = df
                self.classes.append(a)
                
    def add_classroom(self, name):
        if name not in self.names:
            self.names.append(name)
            a = classrooms(name)
            a.students.to_csv(f"data\{name}.csv", index=False)
            self.classes.append(a)

    def transfer_student(self, name, to_class, from_class):
        to_class.add_student(from_class.students.loc[from_class.students["name"] == name].values.flatten().tolist())
        from_class.remove_student(name)
    
    def get_class(self, name):
        idx = 0
        if self.names and name in self.names:
            idx = self.names.index(name)
        else: return [" "]
            
        return list(self.classes[idx].students['name'])
    
class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Attendence Management")
        self.geometry("")
        if(os.path.isfile("./attendance.ico") and os.access("./attendance.ico", os.R_OK)):
            self.iconbitmap("attendance.ico")
        
    def main_win(self, school):
        self.main = ttk.Frame(self)
        self.main.pack(fill="both", expand = True)

        title = ttk.Label(self.main, width = 19, text = "Attendance Management", font=("Times New Roman", 12), foreground="black", background = "white")
        title.grid(column=0, row=0, columnspan = 19, padx=5, pady=5)
        
        new_classroom = ttk.Button(self.main, text='New Classroom', width=30, command=lambda:\
                      [self.new_classroom_win(school), self.main.pack_forget()])
        new_classroom.grid(column=0, row=1, sticky=tk.E, padx=5, pady=5)
        
        new_student = ttk.Button(self.main, text='Add Student', width=30, command=lambda:\
                      [self.add_student_win(school), self.main.pack_forget()])
        new_student.grid(column=0, row=2, sticky=tk.E, padx=5, pady=5)
        
        delete_student = ttk.Button(self.main, text='Remove Student', width=30, command=lambda:\
                      [self.remove_student_win(school), self.main.pack_forget()])
        delete_student.grid(column=0, row=6, sticky=tk.E, padx=5, pady=5)
        
        transefer_frame = ttk.Button(self.main, text='Transfer Student', width=30, command=lambda:\
                      [self.transfer_win(school), self.main.pack_forget()])
        transefer_frame.grid(column=0, row=5, sticky=tk.E, padx=5, pady=5)
        
        
        take_attendance = ttk.Button(self.main, text='Take Attendance', width=30, command=lambda:\
                      [self.take_attendance_win(school), self.main.pack_forget()])
        take_attendance.grid(column=0, row=3, sticky=tk.E, padx=5, pady=5)
        
        show = ttk.Button(self.main, text='Show Classrooms', width=30, command=lambda:\
                      [self.show_class_win(school), self.main.pack_forget()])
        show.grid(column=0, row=4, sticky=tk.E, padx=5, pady=5)
        
    def new_classroom_win(self, school):
        self.new_classroom = ttk.Frame(self)
        self.new_classroom.pack(fill="both", expand = True)

        label = ttk.Label(self.new_classroom, text="Class Name: ")
        label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
        name = ttk.Entry(self.new_classroom)
        name.grid(column=1, row=0, sticky=tk.E, padx=5, pady=5)
        
        submit = ttk.Button(self.new_classroom, text='Submit', command=lambda:\
                      [school.add_classroom(name.get()), submit_label.config(text="Submitted!", fg="green")])
        submit.grid(column=2, row=3, sticky=tk.E, padx=5, pady=5)
        
        main_menu_button = ttk.Button(self.new_classroom, text='Main Menu', command=lambda:\
                      [self.main_win(school), self.new_classroom.pack_forget()])
        main_menu_button.grid(column=1, row=3, sticky=tk.E, padx=5, pady=5)
        
        submit_label = tk.Label(self.new_classroom, text="")
        submit_label.grid(column=0, row=4, sticky=tk.W, padx=5, pady=5)
        
    def add_student_win(self, school):
        self.new_student = ttk.Frame(self)
        self.new_student.pack(fill="both", expand = True)

        label = ttk.Label(self.new_student, text="Class Name: ")
        label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
        name_list = ttk.Combobox(self.new_student, value=school.names)
        name_list.grid(column=1, row=0, sticky=tk.W, padx=5, pady=5)
        
        label = ttk.Label(self.new_student, text="ID: ")
        label.grid(column=0, row=2, sticky=tk.W, padx=5, pady=5)
        Id = ttk.Entry(self.new_student)
        Id.grid(column=1, row=2, sticky=tk.E, padx=5, pady=5)
        
        label = ttk.Label(self.new_student, text="Name: ")
        label.grid(column=0, row=3, sticky=tk.W, padx=5, pady=5)
        name = ttk.Entry(self.new_student)
        name.grid(column=1, row=3, sticky=tk.E, padx=5, pady=5)
        
        submit = ttk.Button(self.new_student, text='Submit', command=lambda:\
                      [school.classes[school.names.index(name_list.get())].add_student([Id.get(), name.get()]),\
                       submit_label.config(text="Submitted!", fg="green")])
        submit.grid(column=2, row=4, sticky=tk.E, padx=5, pady=5)
        
        main_menu_button = ttk.Button(self.new_student, text='Main Menu', command=lambda:\
                      [self.main_win(school), self.new_student.pack_forget()])
        main_menu_button.grid(column=1, row=4, sticky=tk.E, padx=5, pady=5)
        
        submit_label = tk.Label(self.new_student, text="")
        submit_label.grid(column=0, row=4, sticky=tk.W, padx=5, pady=5)
        
    def remove_student_win(self, school):
        self.remove_student_frame = tk.Frame(self)
        self.remove_student_frame.pack(fill="both", expand = True)

        def get_students_list(e):
            var.config(value=school.get_class(class_list.get()))

        label = ttk.Label(self.remove_student_frame, text="Class Name: ")
        label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
        class_list = ttk.Combobox(self.remove_student_frame, value=school.names)
        class_list.bind("<<ComboboxSelected>>", get_students_list)
        class_list.grid(column=1, row=0, sticky=tk.W, padx=5, pady=5)

        label = ttk.Label(self.remove_student_frame, text="Student Name: ")
        label.grid(column=0, row=1, sticky=tk.W, padx=5, pady=5)
        var = ttk.Combobox(self.remove_student_frame, value=[" "])
        var.grid(column=1, row=1, sticky=tk.W, padx=5, pady=5)

        submit = ttk.Button(self.remove_student_frame, text='Submit', command=lambda:\
                      [school.classes[school.names.index(class_list.get())].remove_student(var.get()),\
                       submit_label.config(text="Submitted!", fg="green")])
        submit.grid(column=2, row=2, sticky=tk.E, padx=5, pady=5)
        
        main_menu_button = ttk.Button(self.remove_student_frame, text='Main Menu', command=lambda:\
                      [self.main_win(school), self.remove_student_frame.pack_forget()])
        main_menu_button.grid(column=1, row=2, sticky=tk.E, padx=5, pady=5)
        
        submit_label = tk.Label(self.remove_student_frame, text="")
        submit_label.grid(column=0, row=2, sticky=tk.W, padx=5, pady=5)
    
    def transfer_win(self, school):
        self.transfer_frame = ttk.Frame(self)
        self.transfer_frame.pack(fill="both", expand = True)
        
        def get_students_list(e):
            student_name.config(value=school.get_class(from_class.get()))
        
        label = ttk.Label(self.transfer_frame, text="From Class: ")
        label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
        from_class = ttk.Combobox(self.transfer_frame, value=school.names)
        from_class.bind("<<ComboboxSelected>>", get_students_list)
        from_class.grid(column=1, row=0, sticky=tk.W, padx=5, pady=5)
        
        label = ttk.Label(self.transfer_frame, text="Student Name: ")
        label.grid(column=0, row=1, sticky=tk.W, padx=5, pady=5)
        student_name = ttk.Combobox(self.transfer_frame, value=[" "])
        student_name.grid(column=1, row=1, sticky=tk.W, padx=5, pady=5)
        
        label = ttk.Label(self.transfer_frame, text="To Class: ")
        label.grid(column=0, row=2, sticky=tk.W, padx=5, pady=5)
        to_class = ttk.Combobox(self.transfer_frame, value=school.names)
        to_class.grid(column=1, row=2, sticky=tk.W, padx=5, pady=5)
        
        submit = ttk.Button(self.transfer_frame, text='Submit', command=lambda:\
                      [school.transfer_student(student_name.get(), school.classes[school.names.index(to_class.get())],\
                                               school.classes[school.names.index(from_class.get())]),\
                       submit_label.config(text="Submitted!", fg="green")])
        submit.grid(column=2, row=3, sticky=tk.E, padx=5, pady=5)
        
        main_menu_button = ttk.Button(self.transfer_frame, text='Main Menu', command=lambda:\
                      [self.main_win(school), self.transfer_frame.pack_forget()])
        main_menu_button.grid(column=1, row=3, sticky=tk.E, padx=5, pady=5)
        
        submit_label = tk.Label(self.transfer_frame, text="")
        submit_label.grid(column=0, row=3, sticky=tk.W, padx=5, pady=5)
    
    def take_attendance_win(self, school):
        self.take_attendance = tk.Frame(self)
        self.take_attendance.pack(fill="both", expand = True)

        def get_students_list(e):
            student_list.delete(0,"end")
            student_list.insert(tk.END, "None")
            student_list.insert(tk.END, *school.get_class(class_list.get()))

        def take_selected_attendence():
            idxs = student_list.curselection()
            for i in idxs:
                school.classes[school.names.index(class_list.get())].take_attendance(student_list.get(i))
        
        label = ttk.Label(self.take_attendance, text="Class Name: ")
        label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
        class_list = ttk.Combobox(self.take_attendance, value=school.names)
        class_list.bind("<<ComboboxSelected>>", get_students_list)
        class_list.grid(column=1, row=0, sticky=tk.W, padx=5, pady=5)

        label = ttk.Label(self.take_attendance, text="Students Name: ")
        label.grid(column=0, row=1, sticky=tk.W, padx=5, pady=5)
        
        student_list = tk.Listbox(self.take_attendance, selectmode='multiple')
        student_list.grid(column=1, row=1, sticky=tk.W, padx=5, pady=5)
        scroll_bar_y = ttk.Scrollbar(self.take_attendance, orient='vertical', command=student_list.yview)
        scroll_bar_y.grid(column=1, row=1, sticky='NSE')
        student_list['yscrollcommand'] = scroll_bar_y.set

        scroll_bar_x = ttk.Scrollbar(self.take_attendance, orient='horizontal', command=student_list.xview)
        scroll_bar_x.grid(column=1, row=2, sticky='NSE')
        student_list['xscrollcommand'] = scroll_bar_y.set
        
        submit = ttk.Button(self.take_attendance, text='Submit', command=lambda:\
                      [take_selected_attendence(),\
                       submit_label.config(text="Submitted!")])
        submit.grid(column=3, row=3, sticky=tk.E, padx=5, pady=5)
        
        main_menu_button = ttk.Button(self.take_attendance, text='Main Menu', command=lambda:\
                      [self.main_win(school), self.take_attendance.pack_forget()])
        main_menu_button.grid(column=2, row=3, sticky=tk.E, padx=5, pady=5)
        
        submit_label = ttk.Label(self.take_attendance, text="")
        submit_label.grid(column=0, row=3, sticky=tk.W, padx=5, pady=5)
    
    def show_class_win(self, school):
        self.show_class = tk.Frame(self)
        self.show_class.pack(fill="both", expand = True)
        
        def show_students_list(e):
            classes_table.delete("1.0","end")
            classes_table.insert(tk.END, str(school.classes[school.names.index(class_list.get())].students))
        
        label = ttk.Label(self.show_class, text="Class Name: ")
        label.grid(column=0, row=0, sticky=tk.W, padx=5, pady=5)
        class_list = ttk.Combobox(self.show_class, value=school.names)
        class_list.bind("<<ComboboxSelected>>", show_students_list)
        class_list.grid(column=1, row=0, sticky=tk.W, padx=5, pady=5)
        
        classes_table = tk.Text(self.show_class, wrap=tk.NONE, height = 10, width = 20)
        classes_table.grid(column=0, row=1, sticky=tk.EW, columnspan=3, padx=5, pady=5)
        
        scroll_bar_y = ttk.Scrollbar(self.show_class, orient='vertical', command=classes_table.yview)
        scroll_bar_y.grid(column=4, row=1, sticky='NSW')
        classes_table['yscrollcommand'] = scroll_bar_y.set
        
        scroll_bar_x = ttk.Scrollbar(self.show_class, orient='horizontal', command=classes_table.xview)
        scroll_bar_x.grid(column=0, row=2, columnspan=3, sticky='NSEW')
        classes_table['xscrollcommand'] = scroll_bar_x.set
        
        main_menu_button = ttk.Button(self.show_class, text='Main Menu', command=lambda:\
                      [self.main_win(school), self.show_class.pack_forget()])
        main_menu_button.grid(column=2, row=0, sticky=tk.E, padx=5, pady=5)
        

if __name__ == "__main__":
    app = App()
    school = schools()
    app.main_win(school)
    app.mainloop()

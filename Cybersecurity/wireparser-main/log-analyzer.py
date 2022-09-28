#! /bin/python3
import sys
import json
import time
from scapy.all import rdpcap
#import scapy_http as http
#from scapy.layers import http

#----------------------------------------------#
# This project is by Ahmed Walid & Mina Ashraf
#
#The purpose of this script is to get important information out of .pcap files,
# which is a format used by popular packet sniffers such as wireshark.
#JSON format was chosen as it makes it more clean and better to see, more modifications could be added and the format could maybe change to xsl in the future.
#The output could be modefied using the scapy library.
#The data.json file is an example of what the output looks like
#----------------------------------------------
if len(sys.argv) != 4:
    print("Usage: ./log-analyzer <option> <log file> <output file>")
    print("eg: ./log-analyzer -o test.pcap out.xsl")


print("Program is running...")

output = []

def build_output(packets):
    packet_count = 0
    for p in packets:
        packet_count = packet_count + 1
        
        #More information could be added here to be put in the JSON file.
        output.append({
            'packet_number': packet_count,
            'time': time.ctime(int(p.time)),
            'dst_mac': p.dst,
            'src_mac': p.src
#           'dst_ip': p['IP'].dst,
#           'src_ip': p['IP'].src
                })

if (sys.argv[1] == "-o"):
    file = sys.argv[2]
    packets = rdpcap(file)
    build_output(packets)

    with open(sys.argv[3], 'w') as outfile:
        json.dump(output,outfile, indent=4)


    outfile.close()


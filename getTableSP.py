#-------------------------------------------------------------------------------
# Name:        getTableSP
# Purpose:     Stored Procedure for CMDB viewing of user requested parameter
#
# Author:      apatel
#
# Created:     16/03/2015
# Copyright:   (c) apatel 2015
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import pyodbc

def getTableSP(choice, tableName):
    conn = pyodbc.connect('Trusted_Connection=yes', driver='{SQL Server}', server='SQLDEV1', database='ConfigItemRegistry')
    cur = conn.cursor()

    sql = """SELECT * FROM ConfigItemRegistry.?.?"""
    cur.execute(sql,(choice, table))

    for result in cur:
        print result

    cur.commit()
    cur.close()

def main():
    try:
        choice = raw_input("CIR or CIRSTG: ")
        tableName = raw_input("table name: ")
        getTableSP(choice,tableName)
    except:
        print "Error occurred"

if __name__ == '__main__':
    main()

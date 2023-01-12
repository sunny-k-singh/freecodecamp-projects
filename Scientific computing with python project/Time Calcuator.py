import re
def add_time(time, duration, dayo=None):
    
    
    if dayo is None:
        day='Monday'
    else:
        day=dayo
    #lets convert stuffs into 24 hours format first
    
    def convertToMinutes(time): ##hh mm to minutes
        
        hh = re.findall('[0-9]+',time)[0]
        mm = re.findall('[0-9]+',time)[1]
    
        if ('AM' in time):
            time=int(hh)*60+int(mm)
        elif ('PM' in time):
            time=int(hh)*60+int(mm)+12*60    
        else :
            time=int(hh)*60+int(mm)
        return time
        
    def convertToHours(minutes): #convert to hh mm and days
           
        mins=int(minutes)%60
        hours=int(minutes)//60
        days=hours//24
        hours=hours%24
        
        return mins,hours,days
            
    #Now everything is converted into minutes
    
    start_min=convertToMinutes(time)
    duration_min=convertToMinutes(duration)
    
    total=start_min+duration_min
    
    mins,hours,days=convertToHours(total)
    
    weekdays=['sunday','monday','tuesday','wednesday','thursday','friday','saturday']
    
    day=day.lower()
    
    start_day=weekdays.index(day)
    end_day=start_day+days
    end_day=end_day%7
    
    Weekdays_cap=['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
    
    if dayo is not None:
        
        if hours>=12:
            if hours%12==0:
                return str(12)+':'+(str(mins) if mins>=10 else '0'+str(mins)) +' PM, '+Weekdays_cap[end_day]+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '') 
            else:
                return str(hours%12)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' PM, '+Weekdays_cap[end_day]+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '') 
        else:
            if hours==0:
                return str(12)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' AM, '+Weekdays_cap[end_day]+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '')
            else:
                return str(hours)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' AM, '+Weekdays_cap[end_day]+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '')
    else:
        
        if hours>=12:
            if hours%12==0:
                return str(12)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' PM'+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '')
            else:
                return str(hours%12)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' PM'+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '')
        else:
            if hours==0:
                return str(12)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' AM'+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '')
            else:
                return str(hours)+':'+(str(mins) if mins>=10 else '0'+str(mins))+' AM'+((' ('+str(days) + ' days later)') if days>1 else ' (next day)' if days==1 else '') 
        
    
 

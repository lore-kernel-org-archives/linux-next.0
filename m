From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 2 (compiler-gcc.h)
Date: Fri, 2 Nov 2018 08:56:17 -0700
Message-ID: <20227164-2ef3-d684-bf4e-fb69ac828789@infradead.org>
References: <20181102143018.09feb051@canb.auug.org.au>
 <CANiq72m65bQZefAoFF5dTUB-rPzm4vofZFnDn0nYBG3MsGrjZg@mail.gmail.com>
 <20181103002218.3bd015b3@canb.auug.org.au>
 <CANiq72=kHErmujzMgM4akXeoWkSR0Q3VLd-6Mwiaj5mGan8yZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANiq72=kHErmujzMgM4akXeoWkSR0Q3VLd-6Mwiaj5mGan8yZw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/2/18 6:57 AM, Miguel Ojeda wrote:
> On Fri, Nov 2, 2018 at 2:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Its always OK (and actually useful) to move your branch head up to
>> where Linus merged it (this is usually a fast forward anyway) since
>> that doesn't add any new code to linux-next to conflict with code that
>> is still pending to be merged by Linus.
>>
>> Also, adding bug fixes is always fine.
>>
>> I just want to avoid getting conflicts in linux-next between code
>> that Linus will merge during this merge window and new code destined
>> for the next merge window.
> 
> Thanks Stephen! I assumed as much, but I doubted due to the warning
> (and I wanted to avoid giving you an unexpected surprise tomorrow).
> 
> Cheers,
> Miguel
> 

Hi,

on i386 or x86_64, with gcc (SUSE Linux) 4.8.5, I am seeing this problem:

In file included from <command-line>:0:0:
../include/linux/compiler-gcc.h:75:45: internal compiler error: in function_and_variable_visibility, at ipa.c:825
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                             ^
./../include/linux/compiler_types.h:53:23: note: in definition of macro ‘___PASTE’
 #define ___PASTE(a,b) a##b
                       ^
../include/linux/compiler-gcc.h:75:29: note: in expansion of macro ‘__PASTE’
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                             ^
./../include/linux/compiler_types.h:54:22: note: in expansion of macro ‘___PASTE’
 #define __PASTE(a,b) ___PASTE(a,b)
                      ^
../include/linux/compiler-gcc.h:75:37: note: in expansion of macro ‘__PASTE’
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                     ^
../include/linux/moduleparam.h:28:10: note: in expansion of macro ‘__UNIQUE_ID’
   struct __UNIQUE_ID(name) {}
          ^
../include/linux/module.h:161:32: note: in expansion of macro ‘__MODULE_INFO’
 #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
                                ^
../include/linux/module.h:199:34: note: in expansion of macro ‘MODULE_INFO’
 #define MODULE_LICENSE(_license) MODULE_INFO(license, _license)
                                  ^
../drivers/media/usb/dvb-usb/pctv452e.c:1102:1: note: in expansion of macro ‘MODULE_LICENSE’
 MODULE_LICENSE("GPL");
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.opensuse.org/> for instructions.
../scripts/Makefile.build:293: recipe for target 'drivers/media/usb/dvb-usb/pctv452e.o' failed


-- 
~Randy

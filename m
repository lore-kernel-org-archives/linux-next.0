From: "Peter Teoh" <htmldeveloper@gmail.com>
Subject: sched_setscheduler() API bug in Linux-next
Date: Thu, 5 Jun 2008 00:00:19 +0800
Message-ID: <804dabb00806040900o1a8b3116y3df5149009d8368@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wx-out-0506.google.com ([66.249.82.231]:58726 "EHLO
	wx-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752945AbYFDQAw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 12:00:52 -0400
Received: by wx-out-0506.google.com with SMTP id h29so113377wxd.4
        for <linux-next@vger.kernel.org>; Wed, 04 Jun 2008 09:00:51 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-testers@vger.kernel.org, systemtap@sources.redhat.com, linux-next@vger.kernel.org

I am running on the latest git-updated linux-next (using git fetch -
right? version is 2.6.26-rc4-next-20080530).

After I run my stap script:

probe kernel.function("*@mm/swapfile.c").call {
        printf ("%s -> %s\n", thread_indent(1), probefunc())
        print_backtrace();
        printf("\n");
}
probe kernel.function("*@mm/swapfile.c").return {
        printf ("%s <- %s\n", thread_indent(-1), probefunc())
        printf("\n");
}

I got the next message at the console:

Keeping temporary directory "/tmp/stapweLwM7"
Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: ------------[ cut here ]------------

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: last sysfs file:
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: Process staprun (pid: 4522, ti=f44d1000 task=c83e0000
task.ti=f44d1000)

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: Stack: 00000000 f6ba5880 c04466d0 00000000 c08579b0
c044192a f8f8e300 00000000

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:        00000063 00000020 f8f8e300 c044192a f44d1e64
c0446885 f8f8e300 00000014

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:        f8f8e300 f44d1fb0 c04430b7 0000002c 00020000
00000001 00000001 000006e0

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: Call Trace:

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c04466d0>] ? chill+0x0/0x7

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c044192a>] ? __link_module+0x0/0x14

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c044192a>] ? __link_module+0x0/0x14

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c0446885>] ? stop_machine_run_notype+0x1c/0x2a

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c04430b7>] ? sys_init_module+0x13d2/0x18f1

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c04e82e0>] ? simple_strtoull+0x0/0xe1

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c04c026e>] ? security_capset_set+0x10/0x16

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c042c0cc>] ? sys_capset+0x291/0x2bd

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c04038e5>] ? sysenter_past_esp+0x6a/0x91

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  [<c0630000>] ? schedule+0x57b/0x74e

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel:  =======================

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: Code: 00 00 b8 e0 05 77 c0 e8 ff df 09 00 e9 91 00 00
00 89 da e8 4d ea fe ff 8b 06 8d 4d f0 ba 01 00 00 00 e8 2f 99 fd ff
85 c0 74 04 <0f> 0b eb fe ba e0 05 77 c0 89 d8 e8 ab df 09 00 83 f8 1f
89 c3

Message from syslogd@funnyman at Wed Jun  4 23:56:00 2008 ...
funnyman kernel: EIP: [<c04467d9>] __stop_machine_run+0x102/0x192
SS:ESP 0068:f44d1e20

and dmesg gives:

ISO 9660 Extensions: RRIP_1991A
------------[ cut here ]------------
kernel BUG at kernel/stop_machine.c:147!
invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC

Pid: 4522, comm: staprun Not tainted (2.6.26-rc4-next-20080530 #2)
EIP: 0060:[<c04467d9>] EFLAGS: 00210286 CPU: 0
EIP is at __stop_machine_run+0x102/0x192
EAX: ffffffff EBX: 00000000 ECX: 00200282 EDX: 00200282
ESI: f6ba5880 EDI: d09f3180 EBP: f44d1e50 ESP: f44d1e20
 DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
Process staprun (pid: 4522, ti=f44d1000 task=c83e0000 task.ti=f44d1000)
Stack: 00000000 f6ba5880 c04466d0 00000000 c08579b0 c044192a f8f8e300 00000000
       00000063 00000020 f8f8e300 c044192a f44d1e64 c0446885 f8f8e300 00000014
       f8f8e300 f44d1fb0 c04430b7 0000002c 00020000 00000001 00000001 000006e0
Call Trace:
 [<c04466d0>] ? chill+0x0/0x7
 [<c044192a>] ? __link_module+0x0/0x14
 [<c044192a>] ? __link_module+0x0/0x14
 [<c0446885>] ? stop_machine_run_notype+0x1c/0x2a
 [<c04430b7>] ? sys_init_module+0x13d2/0x18f1
 [<c04e82e0>] ? simple_strtoull+0x0/0xe1
 [<c04c026e>] ? security_capset_set+0x10/0x16
 [<c042c0cc>] ? sys_capset+0x291/0x2bd
 [<c04038e5>] ? sysenter_past_esp+0x6a/0x91
 [<c0630000>] ? schedule+0x57b/0x74e
 =======================
Code: 00 00 b8 e0 05 77 c0 e8 ff df 09 00 e9 91 00 00 00 89 da e8 4d
ea fe ff 8b 06 8d 4d f0 ba 01 00 00 00 e8 2f 99 fd ff 85 c0 74 04 <0f>
0b eb fe ba e0 05 77 c0 89 d8 e8 ab df 09 00 83 f8 1f 89 c3
EIP: [<c04467d9>] __stop_machine_run+0x102/0x192 SS:ESP 0068:f44d1e20
---[ end trace 8a795f9857cd6733 ]---

The error message for kernel/stop_machine:147 is here:

   141
    142                 /* Place it onto correct cpu. */
    143                 kthread_bind(threads[i], i);
    144
    145                 /* Make it highest prio. */
    146                 if (sched_setscheduler(threads[i], SCHED_FIFO,
&param) !        = 0)
    147                         BUG();================>dump here.
    148         }
    149
@

My .config is here:

http://pastebin.com/pastebin.php?dl=m635153d3

Anyone want to make a diagnosis of the problem?

Thanks.
-- 
Regards,
Peter Teoh

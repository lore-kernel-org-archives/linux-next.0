From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: next-2008120[3,4] drm oops (was Re: vanilla kernels hang randomly under Fedora 10 on system with Radeon card)
Date: Fri, 5 Dec 2008 19:50:28 +0100
Message-ID: <200812051950.28443.bzolnier@gmail.com>
References: <200812012342.32575.bzolnier@gmail.com> <200812040107.36616.bzolnier@gmail.com> <200812042055.13731.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.189]:16618 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054AbYLERwa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Dec 2008 12:52:30 -0500
Received: by nf-out-0910.google.com with SMTP id d3so63368nfc.21
        for <linux-next@vger.kernel.org>; Fri, 05 Dec 2008 09:52:28 -0800 (PST)
In-Reply-To: <200812042055.13731.bzolnier@gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org, Benny Amorsen <benny+usenet@amorsen.dk>, linux-next@vger.kernel.org

On Thursday 04 December 2008, Bartlomiej Zolnierkiewicz wrote:

[...]

> To add more fun I'm getting following DRM oops with next-2008120[3,4]:

Here is refreshed oops (I needed to tweak/rebuild the kernel):

BUG: unable to handle kernel NULL pointer dereference at 00000144               
IP: [<c0247371>] drm_addmap_core+0x548/0x561                                    
*pde = 00000000                                                                 
Oops: 0000 [#1] PREEMPT SMP                                                     
last sysfs file: /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/enable       
Modules linked in: radeon(+) lib80211_crypt_tkip xt_state ipt_MASQUERADE iptable_nat nf_nat nf_conntrack_ipv4 nf_conntrack nf_defrag_ipv4 acerhk cpufreq_ondemand binfmt_misc snd_intel8x0 snd_intel8x0m snd_ac97_codec snd_seq_dummy ac97_bus snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device snd_pcm_oss snd_mixer_oss snd_pcm ipw2200 snd_timer libipw snd soundcore snd_page_alloc lib80211 ehci_hcd uhci_hcd parport_pc parport                                                      

Pid: 1740, comm: modprobe Not tainted (2.6.28-rc7-next-20081204 #268) Extensa 2900                                                                              
EIP: 0060:[<c0247371>] EFLAGS: 00213202 CPU: 0                                  
EIP is at drm_addmap_core+0x548/0x561                                           
EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: da1dec00
ESI: da2baac0 EDI: da177a80 EBP: e0010000 ESP: da2c1ea4
 DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
Process modprobe (pid: 1740, ti=da2c1000 task=df8741b0 task.ti=da2c1000)
Stack:
 da177a80 00010000 da1dec00 00000002 da1dec20 da177a88 da1decd4 da1decd4
 da1dece0 00010000 da2c1eec da285800 da285b44 da1dec00 c02473f2 00000001
 00000082 da2c1eec da2c1ef4 00010000 e085674c 00000001 00000082 da285b40
Call Trace:
 [<c02473f2>] drm_addmap+0x14/0x2e
 [<e085674c>] radeon_driver_load+0xef/0x15a [radeon]
 [<c024bb73>] drm_get_dev+0x240/0x4ab
 [<c01e48af>] kobject_get+0xf/0x13
 [<c024821d>] drm_init+0x5a/0x89
 [<e0832000>] radeon_init+0x0/0x14 [radeon]
 [<c010112c>] _stext+0x44/0x108
 [<c01430a8>] sys_init_module+0x87/0x174
 [<c0102eb1>] sysenter_do_call+0x12/0x25
 [<c0310000>] rtl8139_init_one+0x685/0x85e
Code: 12 0d 00 eb 35 8b 3c 24 8b 47 10 c7 47 1c 00 00 00 00 c1 e0 0c 89 47 18 8b 44 24 10 e8 a8 12 0d 00 8b 54 24 08 8b 82 b0 02 00 00 <8b> 80 44 01 00 00 89 47 20 8b 4c 24 44 89 39 83 c4 28 89 d8 5b
EIP: [<c0247371>] drm_addmap_core+0x548/0x561 SS:ESP 0068:da2c1ea4
---[ end trace b2c7f2a062698806 ]---

[...]

> which I think may be caused by:
> 
> commit c2f29f764c0daa0084674d4a463e7158ac5c4dc4
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Fri Nov 28 14:22:24 2008 +1000
> 
>     drm: move to kref per-master structures.
> 
> however I haven't verified it yet.

It is confirmed now, reverting commit

c2f29f764c0daa0084674d4a463e7158ac5c4dc4
("drm: move to kref per-master structures.")

and [the one depending on the above one]

21680220acd264620d7172ed99868bf580ecf0d4.
("drm: fix leak of uninitialized data to userspace")

fixes the oops and makes DRI being enabled again.


The oops itself happens when loading 'radeon' module and is caused by
primary->master dereference (+ primary being NULL) in the following chunk:

@@ -319,6 +319,7 @@ static int drm_addmap_core(struct drm_device * dev, unsigned
        list->user_token = list->hash.key << PAGE_SHIFT;
        mutex_unlock(&dev->struct_mutex);

+       list->master = dev->primary->master;
        *maplist = list;
        return 0;
        }

Debug data:

$ gdb vmlinux

(gdb) l *0xc0247371
0xc0247371 is in drm_addmap_core (drivers/gpu/drm/drm_bufs.c:322).
317             }
318
319             list->user_token = list->hash.key << PAGE_SHIFT;
320             mutex_unlock(&dev->struct_mutex);
321
322             list->master = dev->primary->master;
323             *maplist = list;
324             return 0;
325             }
326

$ objdump -d drivers/gpu/drm/drm_bufs.o
...
00001fb9 <drm_addmap_core>:
...
    24f2:       e8 fc ff ff ff          call   24f3 <drm_addmap_core+0x53a>
    24f7:       8b 54 24 08             mov    0x8(%esp),%edx
    24fb:       8b 82 b0 02 00 00       mov    0x2b0(%edx),%eax
->  2501:       8b 80 44 01 00 00       mov    0x144(%eax),%eax
    2507:       89 47 20                mov    %eax,0x20(%edi)
...

Hope this helps.

Thanks,
Bart

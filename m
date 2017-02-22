From: Xiong Zhou <xzhou@redhat.com>
Subject: Re: Starting kvm/qemu guest crash kernel linux-next 0221 tree
Date: Wed, 22 Feb 2017 21:55:49 +0800
Message-ID: <20170222135549.xhogxcxnibamzvor@XZHOUW.usersys.redhat.com>
References: <20170222015243.bzcnin2xbygak4wl@XZHOUW.usersys.redhat.com>
 <e59d5584-fa25-a925-65b8-7394f51c0390@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:32934 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932120AbdBVNzv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Feb 2017 08:55:51 -0500
Content-Disposition: inline
In-Reply-To: <e59d5584-fa25-a925-65b8-7394f51c0390@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Xiong Zhou <xzhou@redhat.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Wed, Feb 22, 2017 at 09:28:21AM +0100, Paolo Bonzini wrote:
> 
> 
> On 22/02/2017 02:52, Xiong Zhou wrote:
> > Hi,
> > 
> > Starting a guest begin to crash kernel on 0221 -next tree.
> > 
> > It's fine on 0220 tree.

I reproduced only once. Now it's hard to reproduce.
> 
> Can you try commits a26d553400b30b6e0389f5c723c0fc6f7ea473da (0221) and

With above commit reverted by git revert -m 1, no panic so far.
But it's hard to reproduce.


> b95234c840045b7c72380fd14c59416af28fcb02 (0220)?
> 
> What is the guest and the QEMU command line?

It's a RHEL-7.3 guest on a RHEL-7.3+ host

cmdline:
    /usr/libexec/qemu-kvm -name 73h -S -machine pc-i440fx-rhel7.0.0,accel=kvm,usb=off,dump-guest-core=off -cpu Haswell,-hle,-rtm -m 8000 -realtime mlock=off -smp 8,sockets=8,cores=1,threads=1 -uuid aab09e0f-d48a-4223-9b81-35d4718d59fc -no-user-config -nodefaults -chardev socket,id=charmonitor,path=/var/lib/libvirt/qemu/domain-2-73h/monitor.sock,server,nowait -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-hpet -no-shutdown -global PIIX4_PM.disable_s3=1 -global PIIX4_PM.disable_s4=1 -boot strict=on -device ich9-usb-ehci1,id=usb,bus=pci.0,addr=0x6.0x7 -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,bus=pci.0,multifunction=on,addr=0x6 -device ich9-usb-uhci2,masterbus=usb.0,firstport=2,bus=pci.0,addr=0x6.0x1 -device ich
 9-usb-uhci3,masterbus=usb.0,firstport=4,bus=pci.0,addr=0x6.0x2 -device virtio-serial-pci,id=virtio-serial0,bus=pci.0,addr=0x5 -drive file=/var/lib/libvirt/images/rhel73.qcow2,format=qcow2,if=none,id=drive-ide0-0-0 -device ide-hd,bus=ide.0,unit=0,drive=drive-ide0-0-0,id=ide0-0-0,bootindex=1 -drive file=/var/lib/libvirt/images/73h.qcow2,format=qcow2,if=none,id=drive-ide0-0-1 -device ide-hd,bus=ide.0,unit=1,drive=drive-ide0-0-1,id=ide0-0-1 -drive file=/root/RHEL-7.2-20151030.0-Server-x86_64-dvd1.iso,format=raw,if=none,id=drive-ide0-1-0,readonly=on -device ide-cd,bus=ide.1,unit=0,drive=drive-ide0-1-0,id=ide0-1-0,bootindex=2 -netdev tap,fd=25,id=hostnet0 -device rtl8139,netdev=hostnet0,id=net0,mac=52:54:00:83:12:7b,bus=pci.0,addr=0x3 -chardev pty,id=charserial0 -device isa-serial,chardev=char
 serial0,id=serial0 -chardev spicevmc,id=charchannel0,name=vdagent -device virtserialport,bus=virtio-serial0.0,nr=1,chardev=charchannel0,id=channel0,name=com.redhat.spice.0 -spice port=5900,addr=127.0.0.1,disable-ticketing,image-compression=off,seamless-migration=on -vga qxl -global qxl-vga.ram_size=67108864 -global qxl-vga.vram_size=67108864 -global qxl-vga.vgamem_mb=16 -device intel-hda,id=sound0,bus=pci.0,addr=0x4 -device hda-duplex,id=sound0-codec0,bus=sound0.0,cad=0 -chardev spicevmc,id=charredir0,name=usbredir -device usb-redir,chardev=charredir0,id=redir0,bus=usb.0,port=1 -chardev spicevmc,id=charredir1,name=usbredir -device usb-redir,chardev=charredir1,id=redir1,bus=usb.0,port=2 -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x7 -msg timestamp=on

Thanks,
Xiong

> 
> Paolo

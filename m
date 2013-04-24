From: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for Apr 24 [ PM: Device 1-1.2 failed to resume
 async: error -32 ]
Date: Wed, 24 Apr 2013 22:09:18 +0200
Message-ID: <CA+icZUWUof6BJQWefi-dYfFhO_hRLF5aKsOVO0CAbFCo_UVn2w@mail.gmail.com>
References: <CA+icZUXAwh=jg4f8AGV+-Moxc-kWJrjRhZ8+9pF4s41wDbba4A@mail.gmail.com>
Reply-To: sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+icZUXAwh=jg4f8AGV+-Moxc-kWJrjRhZ8+9pF4s41wDbba4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux PM List <linux-pm-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 24, 2013 at 10:00 PM, Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Apr 24, 2013 at 10:07 AM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
>> Hi all,
>>
>> There will be no linux-next release tomorrow (April 25).
>>
>> Changes since 20130423:
>>
>> The net-next tree lost its build failure.
>>
>> The staging tree gained a build failure for which I disabled a driver.
>>
>> The arm-soc tree gained a conflict against the pm tree.
>>
>> ----------------------------------------------------------------------------
>>
>
> [ CC linux-pm and linux-usb (ehci) folks ]
>
> This happens with my external USB mouse after suspend/resume.
>
> Excerpt (full dmesg and kernel-config attached):
>
> $ dmesg | egrep -i 'usb|async' | grep 1-1.2
> [    1.258602] usb 1-1.2: new low-speed USB device number 3 using ehci-pci
> [    1.368649] usb 1-1.2: New USB device found, idVendor=046d, idProduct=c00e
> [    1.368661] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=0
> [    1.368668] usb 1-1.2: Product: USB-PS/2 Optical Mouse
> [    1.368672] usb 1-1.2: Manufacturer: Logitech
> [    1.957999] input: Logitech USB-PS/2 Optical Mouse as
> /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input4
> [   62.353997] usb 1-1.2: reset low-speed USB device number 3 using ehci-pci
> [   62.636893] PM: Device 1-1.2 failed to resume async: error -32
> [   64.243543] usb 1-1.2: USB disconnect, device number 3
> [   64.380328] usb 1-1.2: new low-speed USB device number 5 using ehci-pci
> [   64.477612] usb 1-1.2: New USB device found, idVendor=046d, idProduct=c00e
> [   64.477618] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=0
> [   64.477621] usb 1-1.2: Product: USB-PS/2 Optical Mouse
> [   64.477623] usb 1-1.2: Manufacturer: Logitech
> [   64.481934] input: Logitech USB-PS/2 Optical Mouse as
> /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input11
>

Thos 3 lines IIRC are important (one line missing above):

[   62.353997] usb 1-1.2: reset low-speed USB device number 3 using ehci-pci
[   62.636877] dpm_run_callback(): usb_dev_resume+0x0/0x20 returns -32
[   62.636893] PM: Device 1-1.2 failed to resume async: error -32

- Sedat -

> Any help/hints/infos welcome :-)!
>
> Regards,
> - Sedat .-
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

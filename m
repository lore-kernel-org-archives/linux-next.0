From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: + softirq-fix-tasklet_kill-and-its-users.patch added to -mm tree
Date: Wed, 21 Sep 2016 19:31:30 -0700
Message-ID: <36fffd08-17ec-0a73-17f3-378597e0c25a@oracle.com>
References: <57e1b041.zRoBcsxStpPQoyeo%akpm@linux-foundation.org>
 <20160921051810.GA396@swordfish> <20160921080942.GA476@swordfish>
 <d072b085-2d07-066c-f1f7-7eab0a45273a@oracle.com>
 <20160922004204.GA701@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160922004204.GA701@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, akpm@linux-foundation.org
Cc: ssantosh@kernel.org, davem@davemloft.net, giovanni.cabiddu@intel.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, isdn@linux-pingi.de, mingo@elte.hu, pebolle@tiscali.nl, peterz@infradead.org, salvatore.benedetto@intel.com, tadeusz.struk@intel.com, tglx@linutronix.de, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, sergey.senozhatsky@gmail.com
List-Id: linux-next.vger.kernel.org

On 9/21/2016 5:42 PM, Sergey Senozhatsky wrote:
> Hello,
>
> On (09/21/16 10:23), Santosh Shilimkar wrote:

[...]

>> Am assuming one of the driver in your test is using the DECLARE_TASKLET
>> to init the tasklet and killed by tasklet_kill() which leaves that
>> tasklet to be still scheduled by tasklet action.
>
> yes, vt does something like this (kbd_bh).
>
>> Can you please try below patch and see if you still see the issue ?
>> Attaching the same, just in case mailer eat the tabs.
>
> hm, didn't completely fix it. the vt is now happy, unlike usbnet.
Good that vt works now.

> and the usbnet case is rather alarming.
>
>
> looking at usbnet_probe()
>
> int
> usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
> {
> ....
> 	skb_queue_head_init (&dev->done);
> 	skb_queue_head_init(&dev->rxq_pause);
> 	dev->bh.func = usbnet_bh;
> 	dev->bh.data = (unsigned long) dev;
> 	INIT_WORK (&dev->kevent, usbnet_deferred_kevent);
> ....
>
>
> first, sometimes tasklet initialisation is performed directly, not via
> tasklet_init().
>
> second, that 't->count == 0' eq 'tasklet_init()' is assumed to be sort of
> a contract. so a simple kzalloc() works fine, and the patch breaks it.
>
Thats really bad that tasklet code is letting users call 
tasklet_schedule() even without any tasklet_init or DECLARE_TASKLET.

> a simple grep in drivers/net/
>
> _next$ git grep tasklet_sched drivers/net/ | awk '{print $1}' | uniq | wc -l
> 60
>
> _next$ git grep tasklet_init drivers/net/ | awk '{print $1}' | uniq | wc -l
> 52
>
> and I don't know how many call-sites outside of drivers/net/ do something
> like this.
>
There are more :-(. Thanks for helping out Sergey.

# git grep tasklet_sched . | awk '{print $1}' | uniq | wc -l
269
# git grep tasklet_init . | awk '{print $1}' | uniq | wc -l
240

Andrew,
I requested you to include this patch but now am not sure anymore.
Looks like there are almost 30 more users which are directly
tweaking 'tasklet_struct' fields and calling other APIs. Hunting them
and fixing them probably would be an exercise and also those changes
needs those changed drivers to be tested.

What do you suggest ? At least this patch needs to be dropped as of now
till we can have complete coverage for those bad users.

Regards,
Santosh

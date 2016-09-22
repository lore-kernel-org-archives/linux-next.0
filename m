From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: + softirq-fix-tasklet_kill-and-its-users.patch added to -mm tree
Date: Thu, 22 Sep 2016 09:42:04 +0900
Message-ID: <20160922004204.GA701@swordfish>
References: <57e1b041.zRoBcsxStpPQoyeo%akpm@linux-foundation.org>
 <20160921051810.GA396@swordfish>
 <20160921080942.GA476@swordfish>
 <d072b085-2d07-066c-f1f7-7eab0a45273a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d072b085-2d07-066c-f1f7-7eab0a45273a@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, ssantosh@kernel.org, akpm@linux-foundation.org, davem@davemloft.net, giovanni.cabiddu@intel.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, isdn@linux-pingi.de, mingo@elte.hu, pebolle@tiscali.nl, peterz@infradead.org, salvatore.benedetto@intel.com, tadeusz.struk@intel.com, tglx@linutronix.de, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, sergey.senozhatsky@gmail.com
List-Id: linux-next.vger.kernel.org

Hello,

On (09/21/16 10:23), Santosh Shilimkar wrote:
> > > > tasklet_init() == Init and Enable scheduling
> > [..]
> > > > @@ -559,7 +559,7 @@ void tasklet_init(struct tasklet_struct
> > > >  {
> > > >  	t->next = NULL;
> > > >  	t->state = 0;
> > > > -	atomic_set(&t->count, 0);
> > > > +	atomic_set(&t->count, 1);
> > 
> 
>    			^^^^^^^^
> > > >  	t->func = func;
> > > >  	t->data = data;
> > > >  }
> > 
> > seems to be in conflict with
> > 
> Static helpers also needs to follow the API.
> 
> >  #define DECLARE_TASKLET(name, func, data) \
> >  struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(0), func, data }
> > 						^^^^^^^
> > 
> >  #define DECLARE_TASKLET_DISABLED(name, func, data) \
> >  struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }
> > 						^^^^^^^
> > 
> 
> > 
> > as well as with the tasklet_{disable, enable} helpers
> > 
> Those are fine since they work like a pair and the use count
> is always balanced.

right, the point was that
  DECLARE_TASKLET_DISABLED()			equals to tasklet_init()
and
  {DECLARE_TASKLET(); tasklet_disable();}	equals to tasklet_init()

> Am assuming one of the driver in your test is using the DECLARE_TASKLET
> to init the tasklet and killed by tasklet_kill() which leaves that
> tasklet to be still scheduled by tasklet action.

yes, vt does something like this (kbd_bh).

> Can you please try below patch and see if you still see the issue ?
> Attaching the same, just in case mailer eat the tabs.

hm, didn't completely fix it. the vt is now happy, unlike usbnet.
and the usbnet case is rather alarming.

 static inline void tasklet_schedule(struct tasklet_struct *t)
 {
+       WARN_ON_ONCE(atomic_read(&t->count) < 1);
+
        if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
                __tasklet_schedule(t);
 }

gives me the following backtrace

[   36.937798]  [<ffffffffa013ff12>] usbnet_open+0x1f9/0x24f [usbnet]
[   36.937800]  [<ffffffff813f7cf7>] __dev_open+0x8c/0xc8
[   36.937801]  [<ffffffff813f7f51>] __dev_change_flags+0xa2/0x13d
[   36.937802]  [<ffffffff813f800c>] dev_change_flags+0x20/0x53
[   36.937803]  [<ffffffff814089da>] do_setlink+0x2f6/0xa31
[   36.937806]  [<ffffffff810cfb66>] ? get_page_from_freelist+0x5f3/0x7b2
[   36.937808]  [<ffffffff810f1995>] ? handle_mm_fault+0x82d/0xcc4
[   36.937809]  [<ffffffff81409973>] rtnl_newlink+0x39b/0x705
[   36.937812]  [<ffffffff813f6d2e>] ? netdev_master_upper_dev_get+0xd/0x57
[   36.937813]  [<ffffffff814096e9>] ? rtnl_newlink+0x111/0x705
[   36.937816]  [<ffffffff81030c5f>] ? update_stack_state.constprop.1+0x4c/0x59
[   36.937818]  [<ffffffff81407737>] rtnetlink_rcv_msg+0x16c/0x17b
[   36.937820]  [<ffffffff814bf065>] ? mutex_lock_nested+0x31f/0x344
[   36.937823]  [<ffffffff8141c204>] ? netlink_deliver_tap+0x234/0x260
[   36.937824]  [<ffffffff814075cb>] ? __rtnl_unlock+0x5e/0x5e
[   36.937826]  [<ffffffff8141f498>] netlink_rcv_skb+0x42/0x83
[   36.937827]  [<ffffffff81407566>] rtnetlink_rcv+0x1e/0x25
[   36.937828]  [<ffffffff8141df8a>] netlink_unicast+0x101/0x18e
[   36.937829]  [<ffffffff8141e7ec>] netlink_sendmsg+0x2ef/0x300
[   36.937832]  [<ffffffff812022b7>] ? import_iovec+0x64/0x84
[   36.937835]  [<ffffffff813dc347>] sock_sendmsg+0xf/0x1a
[   36.937836]  [<ffffffff813dc55b>] ___sys_sendmsg+0x17f/0x1f8
[   36.937838]  [<ffffffff810752db>] ? __lock_is_held+0x3c/0x57
[   36.937841]  [<ffffffff81207e89>] ? __this_cpu_preempt_check+0x13/0x15
[   36.937843]  [<ffffffff813dd7ad>] __sys_sendmsg+0x40/0x61
[   36.937844]  [<ffffffff813dd7ad>] ? __sys_sendmsg+0x40/0x61
[   36.937845]  [<ffffffff813dd7d7>] SyS_sendmsg+0x9/0xb
[   36.937847]  [<ffffffff814c2f6a>] entry_SYSCALL_64_fastpath+0x18/0xad


and there are several big problems here.


looking at usbnet_probe()

int
usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
{
....
	skb_queue_head_init (&dev->done);
	skb_queue_head_init(&dev->rxq_pause);
	dev->bh.func = usbnet_bh;
	dev->bh.data = (unsigned long) dev;
	INIT_WORK (&dev->kevent, usbnet_deferred_kevent);
....


first, sometimes tasklet initialisation is performed directly, not via
tasklet_init().

second, that 't->count == 0' eq 'tasklet_init()' is assumed to be sort of
a contract. so a simple kzalloc() works fine, and the patch breaks it.



a simple grep in drivers/net/

_next$ git grep tasklet_sched drivers/net/ | awk '{print $1}' | uniq | wc -l
60

_next$ git grep tasklet_init drivers/net/ | awk '{print $1}' | uniq | wc -l
52


and I don't know how many call-sites outside of drivers/net/ do something
like this.

	-ss

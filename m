From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: + softirq-fix-tasklet_kill-and-its-users.patch added to -mm tree
Date: Wed, 21 Sep 2016 10:23:52 -0700
Message-ID: <d072b085-2d07-066c-f1f7-7eab0a45273a@oracle.com>
References: <57e1b041.zRoBcsxStpPQoyeo%akpm@linux-foundation.org>
 <20160921051810.GA396@swordfish> <20160921080942.GA476@swordfish>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D4BE268B7B74EE035CC92F8B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:17871 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756023AbcIURZI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2016 13:25:08 -0400
In-Reply-To: <20160921080942.GA476@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, ssantosh@kernel.org
Cc: akpm@linux-foundation.org, davem@davemloft.net, giovanni.cabiddu@intel.com, gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, isdn@linux-pingi.de, mingo@elte.hu, pebolle@tiscali.nl, peterz@infradead.org, salvatore.benedetto@intel.com, tadeusz.struk@intel.com, tglx@linutronix.de, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, sergey.senozhatsky@gmail.com

This is a multi-part message in MIME format.
--------------D4BE268B7B74EE035CC92F8B
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/2016 1:09 AM, Sergey Senozhatsky wrote:
> didn't look into the issue, but this thing
>
Thanks for reporting Sergey.

>>> tasklet_init() == Init and Enable scheduling
> [..]
>>> @@ -559,7 +559,7 @@ void tasklet_init(struct tasklet_struct
>>>  {
>>>  	t->next = NULL;
>>>  	t->state = 0;
>>> -	atomic_set(&t->count, 0);
>>> +	atomic_set(&t->count, 1);
>

    			^^^^^^^^
>>>  	t->func = func;
>>>  	t->data = data;
>>>  }
>
> seems to be in conflict with
>
Static helpers also needs to follow the API.

>  #define DECLARE_TASKLET(name, func, data) \
>  struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(0), func, data }
> 						^^^^^^^
>
>  #define DECLARE_TASKLET_DISABLED(name, func, data) \
>  struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }
> 						^^^^^^^
>

>
> as well as with the tasklet_{disable, enable} helpers
>
Those are fine since they work like a pair and the use count
is always balanced.

Am assuming one of the driver in your test is using the DECLARE_TASKLET
to init the tasklet and killed by tasklet_kill() which leaves that
tasklet to be still scheduled by tasklet action.

Can you please try below patch and see if you still see the issue ?
Attaching the same, just in case mailer eat the tabs.

Regards,
Santosh

 From e3e676e501a59b2a7de6e9f99ec3917c157e9caf Mon Sep 17 00:00:00 2001
From: Santosh Shilimkar <ssantosh@kernel.org>
Date: Wed, 21 Sep 2016 09:58:51 -0700
Subject: [PATCH] softirq: fix DECLARE_TASKLET[_DISABLE] macros init state

In linux-next, commit 1f5e9c3bc47f ("softirq: fix tasklet_kill() and its 
users")
changed the init state of the tasklet but missed to update the macros.

Fix them too.

Reported-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Santosh Shilimkar <ssantosh@kernel.org>
---
  include/linux/interrupt.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 72f0721..cabf575 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -521,10 +521,10 @@ struct tasklet_struct
  };

  #define DECLARE_TASKLET(name, func, data) \
-struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(0), func, data }
+struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }

  #define DECLARE_TASKLET_DISABLED(name, func, data) \
-struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }
+struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(2), func, data }


  enum
-- 
1.9.1








--------------D4BE268B7B74EE035CC92F8B
Content-Type: text/x-diff;
 name="0001-softirq-fix-DECLARE_TASKLET-_DISABLE-macros-init-sta.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-softirq-fix-DECLARE_TASKLET-_DISABLE-macros-init-sta.pa";
 filename*1="tch"

>From e3e676e501a59b2a7de6e9f99ec3917c157e9caf Mon Sep 17 00:00:00 2001
From: Santosh Shilimkar <ssantosh@kernel.org>
Date: Wed, 21 Sep 2016 09:58:51 -0700
Subject: [PATCH] softirq: fix DECLARE_TASKLET[_DISABLE] macros init state

In linux-next, commit 1f5e9c3bc47f ("softirq: fix tasklet_kill() and its users")
changed the init state of the tasklet but missed to update the macros.

Fix them too.

Reported-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Santosh Shilimkar <ssantosh@kernel.org>
---
 include/linux/interrupt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 72f0721..cabf575 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -521,10 +521,10 @@ struct tasklet_struct
 };
 
 #define DECLARE_TASKLET(name, func, data) \
-struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(0), func, data }
+struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }
 
 #define DECLARE_TASKLET_DISABLED(name, func, data) \
-struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(1), func, data }
+struct tasklet_struct name = { NULL, 0, ATOMIC_INIT(2), func, data }
 
 
 enum
-- 
1.9.1


--------------D4BE268B7B74EE035CC92F8B--

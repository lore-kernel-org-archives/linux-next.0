From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: kdump regression compared to v2.6.35
Date: Mon, 30 Aug 2010 16:21:02 +0200
Message-ID: <4C7BBE4E.8080901@kernel.org>
References: <1141332926.1524871283176937097.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1141332926.1524871283176937097.JavaMail.root-k5qu2F3t005+R5eDjrG6zsCp5Q1pQRjfhaY/URYTgi6ny3qCrzbmXA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: CAI Qian <caiqian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hello,

On 08/30/2010 04:02 PM, CAI Qian wrote:
>> Hmm, odd.  So, here's the said debug patch.  It will periodically
>> check all works and report if any work is being delayed for too long.
>> If the max wait goes over 30secs, it will dump all task states and
>> disable itself.  Can you please apply the patch on top of rc2 +
>> wq#for-linus and report the output?  It should tell us who's stuck
>> where.
>
> Nothing new was printed after around 10 minutes.

Eh... that's interesting.  That means no work is stalled on
workqueues, so it at least is not a workqueue stall.  Can you please
try the following then?  Or if sysrq wasn't working because your
keyboard wasn't initialized at that point, you can setup serial
console and trigger sysrq that way.

Thanks.

diff --git a/init/main.c b/init/main.c
index 94ab488..e156b8f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -423,11 +423,19 @@ static void __init setup_command_line(char *command_line)

 static __initdata DECLARE_COMPLETION(kthreadd_done);

+static void show_state_timer_fn(unsigned long data)
+{
+	show_state();
+}
+static DEFINE_TIMER(show_state_timer, show_state_timer_fn, 0, 0);
+
 static noinline void __init_refok rest_init(void)
 	__releases(kernel_lock)
 {
 	int pid;

+	printk("XXX show_state_timer registered\n");
+	mod_timer(&show_state_timer, jiffies + 180 * HZ);
 	rcu_scheduler_starting();
 	/*
 	 * We need to spawn init first so that it obtains pid 1, however

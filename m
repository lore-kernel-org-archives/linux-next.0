From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Thu, 22 Dec 2016 16:56:34 -0800
Message-ID: <1482454594.2415.72.camel@HansenPartnership.com>
References: <20161223114513.101402e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161223114513.101402e4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manish Rangankar <manish.rangankar@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <nilesh.javali@cavium.com>, Adheer Chandravanshi <adheer.chandravanshi@qlogic.com>, Chad Dupuis <chad.dupuis@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-next.vger.kernel.org

On Fri, 2016-12-23 at 11:45 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the scsi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/scsi/qedi/qedi_main.c: In function 'qedi_init':
> drivers/scsi/qedi/qedi_main.c:2073:2: error: implicit declaration of
> function 'register_hotcpu_notifier' [-Werror=implicit-function
> -declaration]
>   register_hotcpu_notifier(&qedi_cpu_notifier);
>   ^
> drivers/scsi/qedi/qedi_main.c: In function 'qedi_cleanup':
> drivers/scsi/qedi/qedi_main.c:2113:2: error: implicit declaration of
> function 'unregister_hotcpu_notifier' [-Werror=implicit-function
> -declaration]
>   unregister_hotcpu_notifier(&qedi_cpu_notifier);
>   ^
> 
> Caused by commit
> 
>   ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver
> framework.")
> 
> Interacting with commit
> 
>   8e38db753d95 ("cpu/hotplug: Remove obsolete cpu hotplug
> register/unregister functions")
> 
> from the tip tree.

Well, that's a bit of a problem given that the SCSI tree has a pending
pull request including this driver.

Thomas, can you do another fixup in your tip tree like you did for the
two BNX2* drivers?

Thanks,

James

From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v3 2/2] workqueue: respect isolated cpus when queueing an
 unbound work
Date: Mon, 6 Nov 2017 07:26:15 -0800
Message-ID: <20171106152615.GB3252168@devbig577.frc2.facebook.com>
References: <20171103135911.GS3252168@devbig577.frc2.facebook.com>
 <1509722870-27618-1-git-send-email-tal.shorer@gmail.com>
 <1509722870-27618-2-git-send-email-tal.shorer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1509722870-27618-2-git-send-email-tal.shorer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tal Shorer <tal.shorer@gmail.com>
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, frederic@kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Nov 03, 2017 at 05:27:50PM +0200, Tal Shorer wrote:
> Initialize wq_unbound_cpumask to exclude cpus that were isolated by
> the cmdline's isolcpus parameter.
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

Plese feel free to route with the prerequisite changes.  If not, I'll
apply them after the next -rc1 window.

Thanks.

-- 
tejun

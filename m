From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: kdump regression compared to v2.6.35
Date: Sun, 29 Aug 2010 10:57:26 +0200
Message-ID: <4C7A20F6.5070802@kernel.org>
References: <181596874.1477361283065264575.JavaMail.root@zmail06.collab.prod.int.phx2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <181596874.1477361283065264575.JavaMail.root-k5qu2F3t005+R5eDjrG6zsCp5Q1pQRjfhaY/URYTgi6ny3qCrzbmXA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: caiqian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 08/29/2010 09:01 AM, caiqian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wrote:
> Further bisect indicated this bad commit from the merge. Given kdump
> kernel was running with maxcpus=1, I guess this work caused fs/bio.c
> hung in the workqueue on UP. Reverted the whole merge let kdump work
> again.

Can you please pull from the following git tree and see whether it
fixes the problem?  There was a bug in nr_active accounting.

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-linus

Thanks.

-- 
tejun

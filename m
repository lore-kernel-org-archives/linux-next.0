From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2015-01-27-16-19 uploaded (smack)
Date: Wed, 28 Jan 2015 10:07:53 -0800
Message-ID: <54C92579.4090001@infradead.org>
References: <54c82b3b.HD9c5l1koPm4DGUG%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54c82b3b.HD9c5l1koPm4DGUG%akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, Casey Schaufler <casey@schaufler-ca.com>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 01/27/15 16:20, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2015-01-27-16-19 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.

(from linux-next)

on i386:
CONFIG_NETWORK_SECMARK is not enabled.
CONFIG_SECURITY_SMACK_NETFILTER is not enabled.

../security/smack/smack_netfilter.c: In function 'smack_ipv4_output':
../security/smack/smack_netfilter.c:55:6: error: 'struct sk_buff' has no member named 'secmark'
   skb->secmark = skp->smk_secid;
      ^

Error in security/smack/Makefile:

smack-$(CONFIG_NETFILTER) += smack_netfilter.o


-- 
~Randy

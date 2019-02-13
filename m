From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2019-02-12-15-37 uploaded (net/ipv4/devinit.c)
Date: Tue, 12 Feb 2019 19:09:59 -0800
Message-ID: <011529bd-bae3-f815-0d7e-6da733c1cf55@infradead.org>
References: <20190212233743.mGzbg%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212233743.mGzbg%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2/12/19 3:37 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2019-02-12-15-37 has been uploaded to
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

on x86_64:

when CONFIG_SYSCTL is not enabled:

ld: net/ipv4/devinet.o: in function `devinet_init_net':
devinet.c:(.text+0x3ad): undefined reference to `sysctl_devconf_inherit_init_net'



-- 
~Randy

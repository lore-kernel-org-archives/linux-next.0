From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 11 (perf_event_amd.c)
Date: Fri, 11 May 2012 16:52:16 -0700
Message-ID: <4FADA630.1080806@xenotime.net>
References: <20120511162738.1d65b6efe099a54841be6313@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120511162738.1d65b6efe099a54841be6313@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
List-Id: linux-next.vger.kernel.org

On 05/10/2012 11:27 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 201205010:



when CONFIG_LOCAL_APIC is not enabled:

perf_event_amd.c:(.text+0x11530): undefined reference to `get_ibs_caps'


-- 
~Randy

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 17:23:57 +1000
Message-ID: <1213255437.14478.30.camel@pasglop>
References: <20080611192748.686236fd.sfr@canb.auug.org.au>
	<20080611095951.GB14033@elte.hu>
	<18512.32267.636550.47385@cargo.ozlabs.ibm.com>
	<20080612053335.GA22035@bubble.grove.modra.org>
	<20080612170505.6049fa75.sfr@canb.auug.org.au>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20080612170505.6049fa75.sfr@canb.auug.org.au>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@ozlabs.org, Thomas@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Alan Modra <amodra@bigpond.net.au>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

On Thu, 2008-06-12 at 17:05 +1000, Stephen Rothwell wrote:
> So I tried this (added --relax to LDFLAGS_vmlinux if CONFIG FTRACE was
> set) and got this;
> 
> /usr/bin/ld: --relax and -r may not be used together
> 
> So, I will disable FTRACE on powerpc for now by removing HAVE_FTRACE
> from
> being selected in arch/powerpc/Kconfig.

So we completely lose ftrace for the sake of a config that nobody
sane ever uses (allyesconfig) ? :-)

Cheers,
Ben.

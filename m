From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: samples/kdbus/kdbus-workers.c and cross compiling MIPS
Date: Fri, 31 Jul 2015 16:54:18 +1000
Message-ID: <1438325658.29353.8.camel@ellerman.id.au>
References: <20150729161912.GF18685@windriver.com>
	 <CANq1E4TgWK-8JkUtOYfTOL9Dx=jWeVpA-h881TXSA3BNjp+MPw@mail.gmail.com>
	 <55BA2B91.5070107@windriver.com>
	 <CANq1E4S7awCfPaNduoG8ENHmnGhR7-VT-9LvGwREZs-h8zNmzQ@mail.gmail.com>
	 <55BA4375.7010400@windriver.com> <20150731095511.1a6f1257@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150731095511.1a6f1257@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, David Herrmann <dh.herrmann@gmail.com>, David Herrmann <dh.herrmann@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Mack <daniel@zonque.org>, Djalal Harouni <tixxdz@opendz.org>, linux-mips@linux-mips.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 2015-07-31 at 09:55 +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Thu, 30 Jul 2015 11:32:05 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> >
> > Well, it only shows up when we cross compile for mips.  It does not
> > seem to be showing up for any other arch (and we cover ~10 of them).
> > Nor does it show up for x86 builds.  Also note that the main linux-next
> > build machine is actually a PowerPC host.
> 
> Actually I do my linux-next builds on an x86_64 host, and the overnight
> builds are spread between that and a PowerPC host.
> 
> > > Please note that this is HOSTCC running, so it does *NOT* require the
> > > toolchain for your cross-compiled architecture.
> > > 
> > > Also, please tell me why your system has "linux/memfd.h" available,
> > > but __NR_memfd_create is undefined?
> > 
> > My local system is a bog standard ubuntu 14.10 and it sees it.  I dont
> > know what distro the linux-next IBM powerpc builder is based on but it
> > also sees it....
> 
> Our build hosts are running Debian stable and Ubuntu <mumble> (I think -
> I will check on this latter).

The x86 builders are debian:jessie and the ppc one is currently Ubuntu 14.04.2.

cheers

From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: IO BAR sizing warning
Date: Thu, 11 Jun 2009 12:07:39 -0700
Message-ID: <20090611120739.012a0306@jbarnes-g45>
References: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
	<4A013A70.30101@kernel.org>
	<20090506092418.3fffab6b@hobbes>
	<CAC4B8726E86A142B27A9E9A2F2F1247AB7A8255@rrsmsx505.amr.corp.intel.com>
	<20090506110034.3c7d6e67@hobbes>
	<20090603164954.2a7aa3f4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-140.bluehost.com ([67.222.39.30]:57364 "HELO
	outbound-mail-140.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751183AbZFKTO7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Jun 2009 15:14:59 -0400
In-Reply-To: <20090603164954.2a7aa3f4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>, Yinghai Lu <yinghai@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Wed, 3 Jun 2009 16:49:54 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Wed, 6 May 2009 11:00:34 -0700 Jesse Barnes
> <jbarnes@virtuousgeek.org> wrote:
> >
> > On Wed, 6 May 2009 11:41:12 -0600
> > "Wilcox, Matthew R" <matthew.r.wilcox@intel.com> wrote:
> > 
> > > I think PowerPC's IO_SPACE_LIMIT is defined incorrectly.
> > > 
> > > On 64-bit, it's currently set to 0xffff'ffff'ffff'ffff.  This
> > > can't possibly work, there's no way for the PCI bus to transmit
> > > 64-bit IO-port addresses.  It should probably be defined to
> > > 
> > > 0xffffffffU
> > 
> > But yeah on a bus level it clearly needs to be limited to 32 bits,
> > but ISTR that some arches use the high resource bits for tracking
> > I/O resources on a systemwide basis (too lazy to look atm).
> > 
> > So either we need to split the definition between bus & resource
> > usage, or add a cast here...
> 
> I am still getting the original warning.  For reference, the following
> architectures will probably have the same:
> 
> ia64:		0xffffffffffffff
> powerpc:	~(0UL)
> sparc64:	0xffffffffffffffffUL

Any comments here Ben?  Seems this define is overloaded...

-- 
Jesse Barnes, Intel Open Source Technology Center

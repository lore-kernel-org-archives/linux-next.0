From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: IO BAR sizing warning
Date: Wed, 6 May 2009 11:00:34 -0700
Message-ID: <20090506110034.3c7d6e67@hobbes>
References: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
	<4A013A70.30101@kernel.org>
	<20090506092418.3fffab6b@hobbes>
	<CAC4B8726E86A142B27A9E9A2F2F1247AB7A8255@rrsmsx505.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-14.bluehost.com ([69.89.18.114]:45150 "HELO
	outbound-mail-14.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754091AbZEFSAh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2009 14:00:37 -0400
In-Reply-To: <CAC4B8726E86A142B27A9E9A2F2F1247AB7A8255@rrsmsx505.amr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Cc: Yinghai Lu <yinghai@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Wed, 6 May 2009 11:41:12 -0600
"Wilcox, Matthew R" <matthew.r.wilcox@intel.com> wrote:

> I think PowerPC's IO_SPACE_LIMIT is defined incorrectly.
> 
> On 64-bit, it's currently set to 0xffff'ffff'ffff'ffff.  This can't
> possibly work, there's no way for the PCI bus to transmit 64-bit
> IO-port addresses.  It should probably be defined to
> 
> 0xffffffffU

TOP POSTER!

But yeah on a bus level it clearly needs to be limited to 32 bits, but
ISTR that some arches use the high resource bits for tracking I/O
resources on a systemwide basis (too lazy to look atm).

So either we need to split the definition between bus & resource usage,
or add a cast here...
-- 
Jesse Barnes, Intel Open Source Technology Center

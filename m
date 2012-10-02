From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: linux-next: manual merge of the xen-two tree with Linus'
 tree
Date: Tue, 02 Oct 2012 14:33:43 +0100
Message-ID: <506B0957020000780009F107@nat28.tlf.novell.com>
References: <20121002141949.f6e61437bdce0d56d9d4321e@canb.auug.org.au>
 <alpine.DEB.2.02.1210021141370.29232@kaball.uk.xensource.com>
 <506AEE0C020000780009F0A1@nat28.tlf.novell.com>
 <alpine.DEB.2.02.1210021240020.29232@kaball.uk.xensource.com>
 <506AF20C020000780009F0B5@nat28.tlf.novell.com>
 <20121002125519.GB9009@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:45168 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751692Ab2JBNdt convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-next@vger.kernel.org:5:2>);
	Tue, 2 Oct 2012 09:33:49 -0400
In-Reply-To: <20121002125519.GB9009@phenom.dumpdata.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

>>> On 02.10.12 at 14:55, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> On Tue, Oct 02, 2012 at 12:54:20PM +0100, Jan Beulich wrote:
>> >>> On 02.10.12 at 13:45, Stefano Stabellini <stefano.stabellini@eu.citrix.com> 
> wrote:
>> >> > Considering that dbgp doesn't seem to be very useful without PCI at the
>> >> > moment, could we just turn it into:
>> >> > 
>> >> > dom0-$(CONFIG_PCI) += dbgp.o
>> >> > 
>> >> > ?
>> >> 
>> >> Better not - the code is specifically not PCI-only. And I can't see
>> >> how it would be harmful to be compiled on e.g. ARM (so the
>> >> merge perhaps really should use XEN_DOM0 alone, without
>> >> X86. If anything (and that may indeed be a minor oversight of
>> >> the original patch) one might want it to depend on USB_SUPPORT,
>> >> as without that no in-tree debug port capable driver would be
>> >> able to load (and hence interfere with Xen's use of the debug
>> >> port). However, as long as it builds fine with USB_SUPPORT
>> >> undefined (which I believe it does), having it in the shape it
>> >> is allows for out-of-tree drivers as well (as long as they make
>> >> use of the designated interface).
>> > 
>> > OK for PCI.
>> > Regarding USB_SUPPORT, considering that gbgp.c calls hcd_to_bus, I think
>> > it would make sense to make it depend on it.
>> 
>> As said - I'd prefer to do that only if indeed needed to get things
>> to build without that option. Since include/usb/* doesn't reference
>> CONFIG_USB_SUPPORT, I'm in favor of supporting at least those
>> eventual out-of-tree drivers that do use the pre-existing data
>> structures (and others shouldn't be calling pre-existing APIs
>> anyway). But I wouldn't NAK a patch doing what you suggest
>> either.
> 
> Could it depend on EARLY_PRINTK_DBGP ?

No, that one would definitely be wrong (because we need the
EHCI driver to propagate reset information no matter whether
the kernel uses an early console).

Jan

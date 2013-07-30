From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Replace in linux-next the xen, xen-two, xen-arm with xen/tip.git
 tree instead.
Date: Tue, 30 Jul 2013 13:26:33 -0700
Message-ID: <51F82179.2080405@goop.org>
References: <20130730195316.GA12124@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130730195316.GA12124@phenom.dumpdata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: sfr@canb.auug.org.au, xen-devel@lists.xensource.com, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/30/2013 12:53 PM, Konrad Rzeszutek Wilk wrote:
> Hey,
>
> I was wondering if it would be possible to remove from linux-next
> the three xen trees and instead use a combined tree, similar to the
> x86 tip (so the various maintainers share it)?
>
> The ones that would be removed are:
>
> xen		git	git://git.kernel.org/pub/scm/linux/kernel/git/jeremy/xen.git#upstream/xen
> xen-two		git	git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git#linux-next
> xen-arm		git	git://git.kernel.org/pub/scm/linux/kernel/git/sstabellini/xen.git#linux-next
>
> And instead it would be pulled from:
>
> xen-tip		git	git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git#linux-next
>
> I presume you need Ack's from all of us (so Jeremy and Stefano) so CC-ing them here.
>
> And Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>

Ack from me.

    J

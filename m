From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: linux-next: Tree for Apr 29 (kvm)
Date: Mon, 29 Apr 2013 10:49:54 -0600
Message-ID: <1367254194.16887.100.camel@ul30vt.home>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
	 <517E9758.4000506@infradead.org> <20130429163135.GA2737@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:26748 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757765Ab3D2Qt7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Apr 2013 12:49:59 -0400
In-Reply-To: <20130429163135.GA2737@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gleb Natapov <gleb@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>

On Mon, 2013-04-29 at 19:31 +0300, Gleb Natapov wrote:
> On Mon, Apr 29, 2013 at 08:52:56AM -0700, Randy Dunlap wrote:
> > On 04/29/13 02:17, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20130426:
> > > 
> > 
> > 
> > on x86_64:
> > 
> > arch/x86/kvm/x86.c: In function 'kvm_dev_ioctl_check_extension':
> > arch/x86/kvm/x86.c:2547:22: error: 'pci_bus_type' undeclared (first use in this function)
> > 
> > 
> > Oops, CONFIG_PCI is not enabled.
> Alex, can you look at this please. Before "kvm: Allow build-time configuration
> of KVM device assignment" commit KVM depended on PCI to be enabled.

Yep, patch coming...

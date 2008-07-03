From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Thu, 3 Jul 2008 12:23:10 -0700
Message-ID: <200807031223.10287.jbarnes@virtuousgeek.org>
References: <20080703121055.d6f49ae5.sfr@canb.auug.org.au> <20080703032842.GA26951@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-37.bluehost.com ([69.89.20.191]:59664 "HELO
	outbound-mail-37.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753932AbYGCT3z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 15:29:55 -0400
In-Reply-To: <20080703032842.GA26951@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

On Wednesday, July 02, 2008 8:28 pm Greg KH wrote:
> On Thu, Jul 03, 2008 at 12:10:55PM +1000, Stephen Rothwell wrote:
> > Hi Jesse,
> >
> > Today's linux-next merge of the pci tree got a conflict in  between
> > commit 4433d5ff973e2c1ea2f923eea8935588e7b96c06 ("PCI: handle pci_name()
> > being const") from the driver-core tree and commit
> > 8b285ce84bbc719e363a796f466404576b840d36 ("PCI: fix pci_setup_device()'s
> > sprinting into a const buffer") from the pci tree.
> >
> > Jesse, since dev_set_name is now in mainline, you really should drop this
> > commit and replace it with the one from the driver-core tree (which Greg
> > has hopefully sent you by now).  Or add the equivalent on top of what you
> > have.
> >
> > I have appended it below in case.
>
> Yes, Greg send him these patches earlier today :)

Ok I guess I have to merge upstream into my linux-next tree then.  I've really 
been trying to avoid that so far, but I guess it's time...

Thanks,
Jesse

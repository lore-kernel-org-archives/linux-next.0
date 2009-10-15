From: Bhavesh Davda <bhavesh@vmware.com>
Subject: RE: [Pv-drivers] [PATCH -next] vmxnet3: use dev_dbg, fix build for
 CONFIG_BLOCK=n
Date: Thu, 15 Oct 2009 15:53:33 -0700
Message-ID: <8B1F619C9F5F454E81D90D3C161698D7017DD5644B@EXCH-MBX-3.vmware.com>
References: <20091015152538.74a1cb15.sfr@canb.auug.org.au>
 <8B1F619C9F5F454E81D90D3C161698D7017DD56435@EXCH-MBX-3.vmware.com>
 <4AD7A569.1040308@oracle.com> <200910151547.48247.dtor@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <200910151547.48247.dtor@vmware.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@vmware.com>, "pv-drivers@vmware.com" <pv-drivers@vmware.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, David Miller <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

> From: Dmitry Torokhov [mailto:dtor@vmware.com]
> Sent: Thursday, October 15, 2009 3:48 PM
> To: pv-drivers@vmware.com
> Cc: Randy Dunlap; Bhavesh Davda; Stephen Rothwell; netdev; LKML; linux-
> next@vger.kernel.org; David Miller
> Subject: Re: [Pv-drivers] [PATCH -next] vmxnet3: use dev_dbg, fix build
> for CONFIG_BLOCK=n
> 
> Hi Randy,
> 
> On Thursday 15 October 2009 03:42:49 pm Randy Dunlap wrote:
> > Bhavesh Davda wrote:
> > > Who ever compiles with CONFIG_BLOCK=n? Just kidding...
> >
> > or why does networking need CONFIG_BLOCK at all?  ;)
> >
> > > Thanks again for making this change! Ship it!
> >
> > So could I have used adapter->netdev->dev or adapter->pdev->dev ?
> > either of them?  are they the same?
> >
> 
> They are the same.


Right:

vmxnet3_probe_device(struct pci_dev *pdev,...)

	struct net_device *netdev;
	...
	netdev = alloc_etherdev(sizeof(struct vmxnet3_adapter));
	...
	pci_set_drvdata(pdev, netdev);
	adapter = netdev_priv(netdev);
	adapter->netdev = netdev;
	adapter->pdev = pdev;

- Bhavesh

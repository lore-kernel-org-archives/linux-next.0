From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Tue, 21 Oct 2008 20:47:10 -0700
Message-ID: <200810212047.10925.jbarnes@virtuousgeek.org>
References: <20081022133955.16830a02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-21.bluehost.com ([69.89.21.16]:49149 "HELO
	outbound-mail-21.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751174AbYJVDrP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 23:47:15 -0400
In-Reply-To: <20081022133955.16830a02.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tuesday, October 21, 2008 7:39 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> usr/include/linux/pci.h:21: included file 'linux/io.h' is not exported
>
> Caused by commit 4be3c3f680d40d60a1513dcf1a10c3779defcd73 ("PCI: include
> io.h in pci.h so that ioremap_nocache is defined").
>
> I applied the following patch.

Ah thanks, I forgot about the header export stuff...

Jesse

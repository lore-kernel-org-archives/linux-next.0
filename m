From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Mon, 29 Jun 2009 19:13:24 -0700
Message-ID: <20090629191324.5c86bbc0@jbarnes-g45>
References: <20090630120727.24450bab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-139.bluehost.com ([67.222.39.29]:55196 "HELO
	outbound-mail-139.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752959AbZF3CNX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 22:13:23 -0400
In-Reply-To: <20090630120727.24450bab.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

On Tue, 30 Jun 2009 12:07:27 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "pci_claim_resource" [drivers/pcmcia/yenta_socket.ko]
> undefined!
> 
> Caused by commit 6bb04b65dbff5a5bb01617351dbb0af577084752 ("yenta: Use
> pci_claim_resource").  yenta can be built as a module, but
> pci_claim_resource is not exported ...
> 
> I have used the pci tree from next-20090629 for today.

Damn, thought I built that.  linux-next earns its keep yet again.

-- 
Jesse Barnes, Intel Open Source Technology Center

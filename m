From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the pci tree
Date: Mon, 20 Oct 2008 11:36:50 -0700
Message-ID: <200810201136.50643.jbarnes@virtuousgeek.org>
References: <20081020150051.3a3f751f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-141.bluehost.com ([67.222.38.31]:60065 "HELO
	outbound-mail-141.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752856AbYJTShE (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 14:37:04 -0400
In-Reply-To: <20081020150051.3a3f751f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@enix.org>

On Sunday, October 19, 2008 9:00 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next merge of the pci tree got a conflict in
> drivers/pci/quirks.c between commit
> 2e532d68a2b3e2aa6b19731501222069735c741c ("{pci,pnp} quirks.c: don't use
> deprecated print_fn_descriptor_symbol()") from Linus' tree and commit
> 9a1e6932e1129d0c6b5f06ea39282b21f892a114 ("PCI: allow quirks to be
> compiled out") from the pci tree.
>
> The former commit (which matches commit
> 248cb30af8bd95f1af95d54c0a9558dc2ac62a55 ("PCI: use %pF instead of
> print_fn_descriptor_symbol() in quirks.c") in the pci tree) updates code
> that was moved by the latter.  Since the pci tree also does that update,
> I just used the pci tree version.

Sounds good.  I just rebased onto master so that should be fixed up now.

-- 
Jesse Barnes, Intel Open Source Technology Center

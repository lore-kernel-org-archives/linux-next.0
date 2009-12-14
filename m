From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: acpi tree build failure
Date: Mon, 14 Dec 2009 12:20:23 -0700
Message-ID: <200912141220.23745.bjorn.helgaas@hp.com>
References: <20091214122013.a869739e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g6t0184.atlanta.hp.com ([15.193.32.61]:40362 "EHLO
	g6t0184.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932481AbZLNTUZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 14:20:25 -0500
In-Reply-To: <20091214122013.a869739e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org

On Sunday 13 December 2009 06:20:13 pm Stephen Rothwell wrote:
> Hi Len,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "pnpacpi_protocol" [drivers/char/ipmi/ipmi_si.ko] undefined!
> 
> Caused by commit e80b594fd69039387339e75b4f75c58da74676ae ("PNP: add
> interface to retrieve ACPI device from a PNPACPI device").
> 
> I have used the acpi tree form next-20091211 for today.

I will look at this ASAP, but I'm stuck in a required class all day
today, so I can't do anything until tonight.

Bjorn

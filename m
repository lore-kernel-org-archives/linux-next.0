From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: linux-next: acpi tree build failure
Date: Tue, 12 Aug 2008 22:29:42 +0100
Message-ID: <200808122229.43091.carlos@strangeworlds.co.uk>
References: <20080812131613.e3dfb2f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from phoenix.slamd64.com ([217.10.145.2]:53158 "EHLO
	phoenix.slamd64.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586AbYHLV37 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 17:29:59 -0400
In-Reply-To: <20080812131613.e3dfb2f5.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Kleen <andi@firstfloor.org>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, stable@kernel.org

On Tuesday 12 August 2008 04:16:13 Stephen Rothwell wrote:
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

If needed:

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

Although would it be possible to revert the original patch and take my second
patch with the fix in, rather than applying this patch on top, as I still
want the patch to go into stable?

-Carlos
-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D

From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for Nov 17
Date: Thu, 17 Nov 2011 12:00:13 +0000
Message-ID: <20111117120013.6f447c7c@lxorguk.ukuu.org.uk>
References: <20111117150733.a70faf2c9030d511d5367e1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:53259 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756972Ab1KQL72 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Nov 2011 06:59:28 -0500
In-Reply-To: <20111117150733.a70faf2c9030d511d5367e1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

> The drm tree still had its build failure so I used the version from
> next-20111115.

If the staging gma500 is causing this still please resolve it by marking
the GMA500 in staging "&& BROKEN" for the moment.

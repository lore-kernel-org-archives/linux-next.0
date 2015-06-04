From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: unsigned patch on the top of the nfsd tree
Date: Thu, 4 Jun 2015 09:49:03 -0400
Message-ID: <20150604134903.GA5209@fieldses.org>
References: <20150604075836.3bb3b4a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:35824 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753384AbbFDNtG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 09:49:06 -0400
Content-Disposition: inline
In-Reply-To: <20150604075836.3bb3b4a3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 04, 2015 at 07:58:36AM +1000, Stephen Rothwell wrote:
> I noticed that it appears that you have leaked an unsigned debugging
> patch at the top of the nsfd tree today ...

Whoops--thanks for catching that.

--b.

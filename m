From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] PowerCap: Convert class code to use dev_groups
Date: Fri, 25 Oct 2013 23:42:37 +0200
Message-ID: <2163165.eG5ajaNixF@vostro.rjw.lan>
References: <1382528255-12781-1-git-send-email-treding@nvidia.com> <20131023155905.GA6976@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:59342 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751327Ab3JYVah (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Oct 2013 17:30:37 -0400
In-Reply-To: <20131023155905.GA6976@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday, October 23, 2013 04:59:05 PM Greg Kroah-Hartman wrote:
> On Wed, Oct 23, 2013 at 01:37:35PM +0200, Thierry Reding wrote:
> > The newly added power capping framework uses the obsolete .dev_attrs
> > field of struct class. However this field will be removed in 3.13, so
> > convert the code to use the .dev_groups field instead.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied, thanks!

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] PowerCap: Convert class code to use dev_groups
Date: Wed, 23 Oct 2013 16:59:05 +0100
Message-ID: <20131023155905.GA6976@kroah.com>
References: <1382528255-12781-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47011 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525Ab3JWQA0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2013 12:00:26 -0400
Content-Disposition: inline
In-Reply-To: <1382528255-12781-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 23, 2013 at 01:37:35PM +0200, Thierry Reding wrote:
> The newly added power capping framework uses the obsolete .dev_attrs
> field of struct class. However this field will be removed in 3.13, so
> convert the code to use the .dev_groups field instead.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

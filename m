From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Staging: agnx: switch config_interface to
	bss_info_changed
Date: Tue, 12 May 2009 09:44:48 -0700
Message-ID: <20090512164448.GJ16247@kroah.com>
References: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:35203 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755434AbZELRN2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 13:13:28 -0400
Content-Disposition: inline
In-Reply-To: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: gregkh@suse.de, johannes@sipsolutions.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 12, 2009 at 03:23:13PM +0400, Alexander Beregalov wrote:
> Fix this build error:
> drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
> drivers/staging/agnx/pci.c:315: error: dereferencing pointer to incomplete type
> ..
> drivers/staging/agnx/pci.c:424: error: unknown field 'config_interface' specified in initializer
> 
> config_interface was removed in 2d0ddec5b2b
> ("mac80211: unify config_interface and bss_info_changed")

I do not see that patch in Linus's tree.  Is it in some other tree
(wireless?) and not yet in mainline?

confused,

greg k-h

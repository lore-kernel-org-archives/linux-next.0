From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-04-17-16-02 uploaded (gpu/drm/qxl)
Date: Wed, 17 Apr 2013 18:44:07 -0700
Message-ID: <516F4FE7.4070309@infradead.org>
References: <20130417230333.4A9E15A4206@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:54846 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964827Ab3DRBoV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 21:44:21 -0400
In-Reply-To: <20130417230333.4A9E15A4206@corp2gmr1-2.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org

On 04/17/13 16:03, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-04-17-16-02 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 


I saw this in linux-next a few days ago and forgot to post it.

When CONFIG_DEBUG_FS is not enabled:


drivers/gpu/drm/qxl/qxl_ttm.c:568:33: error: 'qxl_mm_dump_table' undeclared (first use in this function)
drivers/gpu/drm/qxl/qxl_debugfs.c:76:2: error: implicit declaration of function 'drm_debugfs_create_files' [-Werror=implicit-function-declaration]
drivers/gpu/drm/qxl/qxl_debugfs.c:84:2: error: implicit declaration of function 'drm_debugfs_remove_files' [-Werror=implicit-function-declaration]


-- 
~Randy

From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] sony-laptop should depend on RFKILL
Date: Tue, 31 Mar 2009 23:35:55 +0100
Message-ID: <20090331223555.GA31066@srcf.ucam.org>
References: <20090331223407.GA10676@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37049 "EHLO
	vavatch.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757393AbZCaWgC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2009 18:36:02 -0400
Content-Disposition: inline
In-Reply-To: <20090331223407.GA10676@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Mattia Dongili <malattia@linux.it>, Len Brown <len.brown@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 01, 2009 at 02:34:07AM +0400, Alexander Beregalov wrote:
> Fixes this build error when RFKILL is not set:
> 
> drivers/platform/x86/sony-laptop.c:1050: undefined reference to `rfkill_unregister'
> and so on..
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Acked-by: Matthew Garrett <mjg@redhat.com>

-- 
Matthew Garrett | mjg59@srcf.ucam.org

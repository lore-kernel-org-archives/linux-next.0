From: Jesse Barnes <jesse.barnes@intel.com>
Subject: Re: [PATCH next] PCI hotplug: fix build when !SYSFS
Date: Thu, 18 Jun 2009 12:57:33 -0700
Message-ID: <20090618125733.254ffa0d@jbarnes-g45>
References: <1245241397-6781-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:11769 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750956AbZFRT5e (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 15:57:34 -0400
In-Reply-To: <1245241397-6781-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: kaneshige.kenji@jp.fujitsu.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

On Wed, 17 Jun 2009 16:23:17 +0400
Alexander Beregalov <a.beregalov@gmail.com> wrote:

> Fix this build error when CONFIG_SYSFS is not set:
> drivers/pci/slot.c: In function 'pci_hp_create_module_link':
> drivers/pci/slot.c:327: error: 'module_kset' undeclared
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>  drivers/pci/slot.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)

Thanks Alexander, but this one has been obsoleted by the one from Alex
Chiang, which describes the dependencies in Kconfig instead...

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center

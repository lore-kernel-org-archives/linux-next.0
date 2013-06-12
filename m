From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] vhost-scsi: return -ENOENT when no matching
 tcm_vhost_tpg found
Date: Tue, 11 Jun 2013 20:03:08 -0700
Message-ID: <20130612030308.GB9398@kroah.com>
References: <1369731284-4139-1-git-send-email-wenchaolinux@gmail.com>
 <20130528092539.GA22269@hj.localdomain>
 <51B7D166.3000109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45012 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754638Ab3FLDCd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Jun 2013 23:02:33 -0400
Content-Disposition: inline
In-Reply-To: <51B7D166.3000109@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: wenchao <wenchaolinux@gmail.com>
Cc: Asias He <asias@redhat.com>, linux-next@vger.kernel.org, wenchaolinuxkvm@gmail.com, mst@redhat.com, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, pbonzini@redhat.com, nab@linux-iscsi.org

On Wed, Jun 12, 2013 at 09:39:50AM +0800, wenchao wrote:
> cc to Greg for 3.9.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>

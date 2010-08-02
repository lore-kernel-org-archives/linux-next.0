From: Milan Broz <mbroz@redhat.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Mon, 02 Aug 2010 08:44:18 +0200
Message-ID: <4C566942.9020608@redhat.com>
References: <20100802113148.e0b70b34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:61151 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752493Ab0HBGo2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Aug 2010 02:44:28 -0400
In-Reply-To: <20100802113148.e0b70b34.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/02/2010 03:31 AM, Stephen Rothwell wrote:
> After merging the device-mapper tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/md/dm-crypt.c: In function 'crypt_ctr_cipher':
> drivers/md/dm-crypt.c:1095: error: 'bad_mem' undeclared (first use in this function)

hmmmm, Alasdair you edited that patch?
The version I sent compiled cleanly.
(moreover it is just part of patchset which is not yet fully there, seems)

Milan

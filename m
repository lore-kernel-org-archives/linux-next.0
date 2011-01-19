From: Grant Likely <grant.likely@secretlab.ca>
Subject: Reorganization of git.secretlab.ca branches
Date: Wed, 19 Jan 2011 10:35:26 -0700
Message-ID: <AANLkTim0+NLeK=RK3aVSrX+ij113rz+BTExr8zUhCErY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:50067 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210Ab1ASRfs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jan 2011 12:35:48 -0500
Received: by iyj18 with SMTP id 18so1067189iyj.19
        for <linux-next@vger.kernel.org>; Wed, 19 Jan 2011 09:35:47 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Stephen,

I've reorganized my git tree to be clearer, so I'd like to update the
list of branches that you're pulling from me for linux-next:

Here are the branches you're currently pulling:

gcl-current	git	git://git.secretlab.ca/git/linux-2.6#merge
52xx-and-virtex	git	git://git.secretlab.ca/git/linux-2.6#next
devicetree	git	git://git.secretlab.ca/git/linux-2.6#next-devicetree
spi		git	git://git.secretlab.ca/git/linux-2.6#next-spi

I've been using 2 branches for each subsystem that I'm maintaining;
one for bug fixes that should be merged relatively quickly, and one
for linux-next.  Most of the time the 'merge' branches are empty, but
once in a while I've got a bugfix that I want to give wider testing
before asking Linus to pull.  So, I'm thinking that I'd like to change
the trees that you merge to:

52xx-and-virtex-current	git	git://git.secretlab.ca/git/linux-2.6#powerpc/merge
52xx-and-virtex	git	git://git.secretlab.ca/git/linux-2.6#powerpc/next

devicetree-current	git	git://git.secretlab.ca/git/linux-2.6#devicetree/merge
devicetree	git	git://git.secretlab.ca/git/linux-2.6#devicetree/next

spi-current		git	git://git.secretlab.ca/git/linux-2.6#spi/merge
spi		git	git://git.secretlab.ca/git/linux-2.6#spi/next

Does this sound reasonable to you?

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

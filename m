Return-Path: <SRS0=26vq=UG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AA6C2BCA1
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 19:52:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4882F208E3
	for <linux-next@archiver.kernel.org>; Fri,  7 Jun 2019 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559937126;
	bh=CKLLB0IehvJ2iGhsAurK55vlbBDbJQaRBiXaVhl7haw=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=APKeGSSpLOO4y5/ar+lktphbe8TCkbyoC2bPz7O30e2mtF/yfNuUtuW2L6y4rD0hI
	 Pn7i6SZZUxz7K1jtQv46RnJb7VhXTFIuartMA9W+lFzotjeqXqq7xpvlZ9jST3dXbE
	 zSyn6Xu9tuIxoDh1jBodmvqfooyYEIKsUMmg9r9U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfFGTwF (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 Jun 2019 15:52:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:58318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729944AbfFGTwF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Jun 2019 15:52:05 -0400
Received: from localhost (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C03C720868;
        Fri,  7 Jun 2019 19:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559937125;
        bh=CKLLB0IehvJ2iGhsAurK55vlbBDbJQaRBiXaVhl7haw=;
        h=Date:From:To:Cc:Subject:From;
        b=w/TJOLn+W+T1irr4LNybfZLooYAmCbxRJzBheHUa9BtUwkmddo/2y7JBzgCNWQpeK
         fLsoe0vvt2fDagYoPkkFJ2uzu5bYAIbwEyA2/0xVFDbNpcq6pAUGq8WFtQBN3xaha4
         uIqT0GmDSqRDSyFn7wy3xkaInQWhhnNVXpODkx1Y=
Date:   Fri, 7 Jun 2019 14:52:03 -0500
From:   Andy Gross <agross@kernel.org>
To:     sfr@canb.auug.org.au
Cc:     khilman@baylibre.com, bjorn.andersson@linaro.org,
        linux-next@vger.kernel.org
Subject: Change of repo location for QCOM
Message-ID: <20190607195203.GB4984@hector.attlocal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen / Kevin,

We've updated the location of our for-next and ci-next branches.  Can you
update the repo from:

git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git

to:

git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git


Thanks!

Andy Gross

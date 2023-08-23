Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB41EE49AF
	for <linux-next@archiver.kernel.org>; Wed, 23 Aug 2023 07:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbjHWHo6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 23 Aug 2023 03:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbjHWHo6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2023 03:44:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D29BE5F;
        Wed, 23 Aug 2023 00:44:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AA2B065098;
        Wed, 23 Aug 2023 07:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC190C433C7;
        Wed, 23 Aug 2023 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692776693;
        bh=GaRTIporpq7hNYmlo3Hk1lZRAg2JAwt+yZf4dVRRhzk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jE/l4y4krB6m5dzEAl0kB0TGvYHUy8194aLCSAfc0zBYh0OwC6TThxNWD5Irs6eJ7
         6UmQYTawpOSPZpS3ztfdfwtbvD38cAZZkLfeNFiK62lsoH9NneKz70DttlUvUG4m4R
         7hmDpMbjcz+aLUzSHLRxYdSLHA2NN83VZV2kR/qUuKjxY80T4N88aqfXHBZkabNmu4
         hjYWiPMYKuGMt61Kyf1CY6DdlLABSLN/aWaSivM8hRX1hsvxh8Iq2fHU+XWT2lAOYE
         E8O3hiDJhgwv3GF1Fut5uvMiVgZ5YXNnT6iouL6ydE2GyPEk4unl6aKALPtUAjJX+x
         nJg6oVQ8Cau+A==
Date:   Wed, 23 Aug 2023 09:44:49 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 djw-vfs tree
Message-ID: <20230823-wuseln-adrett-2b10dfcb3dee@brauner>
References: <20230822110551.6386dd5d@canb.auug.org.au>
 <20230822025120.GA11286@frogsfrogsfrogs>
 <20230822-turnus-quert-9b11d4e30dc9@brauner>
 <20230822182604.GB11286@frogsfrogsfrogs>
 <20230822-mitbringen-unwillig-176fd9e8873b@brauner>
 <20230822211456.GC11286@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822211456.GC11286@frogsfrogsfrogs>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Hmm.  Looking at the {up,down}_write -> super_{un,}lock_excl conversion,
> I think you missed wait_for_partially_frozen:

Maha, I sure did. Thanks, converted as well.

> That said, freeze_super() took an s_active refcount at the top, called
> super_lock_excl (which means the sb isn't DYING and has been BORN) and
> doesn't release it before calling wait_for_partially_frozen.

Yes.

> AFAICT, the subsequent down_write -> super_lock_excl conversions in
> freeze_super do not gain us much since I don't think the sb can get to
> SB_DYING state without s_active reaching zero, right?  According to

Yes, if you have an active reference count the superblock stays alive.
If it ever gets into SB_DYING we have a bug.

> The missing conversion isn't strictly necessary, but it probably makese
> sense to do it anyway.

I did. Thanks for pointing that out!

> (Aside from that, the conversion looks correct to me.)

Thanks!

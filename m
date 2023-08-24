Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A4FC7113B
	for <linux-next@archiver.kernel.org>; Thu, 24 Aug 2023 07:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjHXHhL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 24 Aug 2023 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233751AbjHXHhG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2023 03:37:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FA6C7;
        Thu, 24 Aug 2023 00:37:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C06D62605;
        Thu, 24 Aug 2023 07:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D63DC433C7;
        Thu, 24 Aug 2023 07:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692862623;
        bh=4P6/qS02pbAzowqmJvKxa6TLoYcRTx4cil5Xp0bt5io=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YI5cJ4KTyZIrdkij+OhNuXURlgZvFt/uODHP1Ay/xN7n/46jWQ8+mkegpeEX6RoSE
         RNwYuYS+v5C9Gu8hHd+J9CkllgqSM0WmIzvRck+N9G22rfFRL6Hk3v8y6o1+raUUe/
         Eqdn3vb1i8f76Aa186YX46Xj5A98H39jUAn2+o/dK5J2q1xgQOx4Ri3hd25l0mpYmE
         cPcmaYJZfsdKdhbUpKX9b19Ms+Vo1vW/8gFeKKbTl+z1N6fMEYuDBlUqo+Odzc1RAo
         LS8haSBvCNELsPbIkUnCIoO/ncSjSTRW90HYE/Wu5DARaZ1DF+IMk84ehGYSYPgI3d
         I1Gc3YBG0Pb7w==
Date:   Thu, 24 Aug 2023 09:36:58 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Willy Tarreau <w@1wt.eu>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zhangjin Wu <falcon@tinylab.org>
Subject: Re: linux-next: manual merge of the nolibc tree with the vfs-brauner
 tree
Message-ID: <20230824-moment-wehten-5a47e319ae66@brauner>
References: <20230824141008.27f7270b@canb.auug.org.au>
 <3028a552-bd75-4ded-9211-62d10768d9ea@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3028a552-bd75-4ded-9211-62d10768d9ea@t-8ch.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> You mentioned before that you plan to have this series in
> -next for some time. If you only submit it to Linux for 6.7 or later

I'm not sure what this is about. v6.6 was always the plan.

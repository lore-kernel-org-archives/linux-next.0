Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821A2C27C40
	for <linux-next@archiver.kernel.org>; Thu, 24 Aug 2023 08:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbjHXIdw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 24 Aug 2023 04:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240566AbjHXIdp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2023 04:33:45 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAAA1724;
        Thu, 24 Aug 2023 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1692866021; bh=S7zan9tA52RjoYkMXkx28yqmhu6QrpPop1MTMy1MTZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qOv70x+FbQOgguxaAXHo//UH7+z9f2lHO7etzegVPt/rIXHIbkLvV/24tshrBhngx
         db21muGory4RvxLK1+a063gszKc5zBpHJpIh9avqfJ+oIgg1y5KrhUkpOSUr+as96N
         Qa7wrxPLBKU3xJGinhqiCe4ZqO16DMPa7XPHwgso=
Date:   Thu, 24 Aug 2023 10:33:40 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Christian Brauner <brauner@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Willy Tarreau <w@1wt.eu>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zhangjin Wu <falcon@tinylab.org>
Subject: Re: linux-next: manual merge of the nolibc tree with the vfs-brauner
 tree
Message-ID: <26bc62c7-32c7-4ef1-b8d1-77738fa98598@t-8ch.de>
References: <20230824141008.27f7270b@canb.auug.org.au>
 <3028a552-bd75-4ded-9211-62d10768d9ea@t-8ch.de>
 <20230824-moment-wehten-5a47e319ae66@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-moment-wehten-5a47e319ae66@brauner>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2023-08-24 09:36:58+0200, Christian Brauner wrote:
> > You mentioned before that you plan to have this series in
> > -next for some time. If you only submit it to Linux for 6.7 or later
> 
> I'm not sure what this is about. v6.6 was always the plan.

I'm referring to "In any case, this needs long soaking in -next." [0]

Which I interpreted as "longer than usual", where "usual" would have
been v6.6.

Anyways Linus should also be able to resolve the conflict for v6.6 with
a small hint in the PR.

[0] https://lore.kernel.org/lkml/20230713-schwalben-anproben-6af2eac149fd@brauner/

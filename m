Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A470CCA47F
	for <linux-next@archiver.kernel.org>; Tue, 12 Jul 2022 21:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbiGLVwn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 12 Jul 2022 17:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiGLVwn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jul 2022 17:52:43 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0738FD76
        for <linux-next@vger.kernel.org>; Tue, 12 Jul 2022 14:52:42 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r10so6828654wrv.4
        for <linux-next@vger.kernel.org>; Tue, 12 Jul 2022 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BY5F2CviozjCkpM1XiYHWmsYIl67plWN6PIvj4Bvyzc=;
        b=BpbPv8otXizx1Xj0yVKPY8YENXuwj9a9ZttXTDj6ic4xUYm1wCANeI/eWpjEiOow2w
         ko5Bvz9NV/+CRZsthQWcaX9TQyHr1F/W7sillwPVz3jR5V53ArMfCmzMTjguMiMbhE+U
         Jr2eW213rnFqKWFOkeIO564gpOhhATy/7RJhIyBAYReTpAoHHJz+hia30h1F3dwtF9lJ
         1N0x3k9hIHT/1xEulq0TFwb0/ylTDiX8MXqOhOC4L/64jmXvoTC1nwT81hl98EZ5GdKP
         PIaYJnQfuyLVqT3Iga7LxI6YAIBbOpdoSfd8IOqWvlZ/Kt8DOo1KoohX+7KGkk1u6i14
         6nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BY5F2CviozjCkpM1XiYHWmsYIl67plWN6PIvj4Bvyzc=;
        b=6xT9kYbAUpp+LOkFOa9FQb/z/T/y+GZlSUa9lnmZBhM9C61rOTo3dToECC1rBElONL
         D5LmQbFeMPZUqu62ltwO7t5lJjAcL40HEZiC6wMTCJ7A12xE7WdAHTirL/LuYUq0AaLB
         URV+DzMBL66Ca6PsOvl47f7l/Kza4HpKhFjzEvu6GV9tjx2IUiKctnD+5EEyrOu+ToTG
         l+F24xuSVUZQO+j4gv2j76+jDihmm0wo9d5F7b4uJeCPLxAWSH4QYIRl4WKZM7QqtTJu
         r0S+vbKbNtr4BsWENzWuo654/kmDByU8DCVJW83Txu0rylxhZKrblK2m7UxpCeKIPHRB
         Gqog==
X-Gm-Message-State: AJIora8bQ1vodKz/7498eWkfnHaid1lEcavhE43xjneRiLYzLJKWZ86T
        Y4nkwLwU1NcOLBldmHwZjrKy8dwiCLDB7VDlNtJ+58KKyM88
X-Google-Smtp-Source: AGRyM1vHtjOBtfPj+bCWb70p89jFbxepUlMkPF53L4IlOP1atRNGelVrg5re2Ew+t7lHFSSJwoPLd5UrUVZu2KeaFKo=
X-Received: by 2002:a5d:4f0b:0:b0:21d:705c:caf with SMTP id
 c11-20020a5d4f0b000000b0021d705c0cafmr79632wru.55.1657662760603; Tue, 12 Jul
 2022 14:52:40 -0700 (PDT)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 12 Jul 2022 17:52:29 -0400
Message-ID: <CAHC9VhTpe=oXHFxVW00QsiXEqkGbNTNjOW3oHMyAcUopAk111g@mail.gmail.com>
Subject: Updated LSM tree for linux-next
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

We just changed LSM maintainers[1] and the LSM tree has moved as a
result.  The new LSM branch for linux-next can be found below:

  git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git (next branch)

Thanks.

[1] https://lore.kernel.org/linux-security-module/165731248606.335227.15503387932450699761.stgit@olly

-- 
paul-moore.com

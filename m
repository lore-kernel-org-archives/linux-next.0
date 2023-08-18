Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9852C001DE
	for <linux-next@archiver.kernel.org>; Fri, 18 Aug 2023 09:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347167AbjHRJCy (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 18 Aug 2023 05:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359010AbjHRJCU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Aug 2023 05:02:20 -0400
X-Greylist: delayed 1499 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:01:58 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3891F3C1D
        for <linux-next@vger.kernel.org>; Fri, 18 Aug 2023 02:01:57 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id 2787A845AA; Fri, 18 Aug 2023 09:16:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346606; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=bwdGq2s65fmEoE7Q4454f3sPsaimmqL0ka717zHFN9m33FfRuwmSPVMqrfHOkAfNp
         dOaNjsi7n/VCdXWHl2ys7Iq7XpkC6uLmLBsBojpXtpn9OXpv5bA8hqi8vzCe8guONx
         BQtRknARFJ0dFaQrNfJACpIqfR0SOAFqbgAj5n0tfomb5iZ54xtMhE0WRStu5HnJMS
         LHTHi1Gi7MgApXZKfUXqeNB8XEV/amAu8ISGGsDfSC68sqy4V9MckRefpJLqXCk+I+
         JWfLtoI6rxzRSfW39Q7jwMrn7mdw75Zuqt4mCEoWvyMeCok999+hZL2/M/FRLx7VM+
         EqBclAITqQGqw==
Received: by mail.leachkin.pl for <linux-next@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cuck.0.hmm51wjn6g@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-next@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak

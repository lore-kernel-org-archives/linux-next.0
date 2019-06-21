Return-Path: <SRS0=K3uQ=UU=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABCFC48BE3
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 00:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6FAA2084E
	for <linux-next@archiver.kernel.org>; Fri, 21 Jun 2019 00:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561078070;
	bh=T0akrqLtJ08uPxEJ0cC/kCrZxJJ2A/ZCbusq6LQZJ+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=jiAFD4BOhOsaWy6aJvBbhlLXNoRP6lBUiZ83Ip3HRivibHdtNB1gHvH0WVyYwlfBI
	 hXcM13+74P7cce63721J203JUV7JAyEy2izU+5+dAfYTbtx5kVYi/rD6eez20t7dJx
	 O8pbBwIef4kzZ21YMpV9OMHKweOlibPThwyolBXo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfFUArt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 20 Jun 2019 20:47:49 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:44973 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfFUArt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Jun 2019 20:47:49 -0400
Received: by mail-lf1-f54.google.com with SMTP id r15so3693593lfm.11
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2019 17:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YlzusH+D6N8YHoX3PYLBUDWKLaxzoz4gcWq9gAaKXVo=;
        b=AWUaT7lCpTIWK+6Kqbv+5luD3tg5ZWaIJkH24j7mgKQv5rz2+SPyMuUzS0tHIvSw3w
         XONeOllWVItjefdGQIJh2dtQnZZZPy26IYT6QyQ6BcsWMAIpXKAP0puHgMrY2lCHABZk
         Y9/N36d3vSzUjjSpe7mCxCKsc9PKcnvHM1iwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YlzusH+D6N8YHoX3PYLBUDWKLaxzoz4gcWq9gAaKXVo=;
        b=K7O7ts6uF/jTn+2W+lzbh0tdW3pkhj1CRf+2vc4wnjlROd/cfz02lenIgIvdW4kBy4
         tAa+XsBIjliZqoQY0NHAFc5Su/FdWVr6if9I4tkUMfre6rovy/PRA3AZFkMkUrGy5ozP
         KpJz+P50BFSlcRjCKAAJElSBSNvcj/pWHRfydeFvpnOZQw+lhg3SMcjlz6YMsPDzPz1a
         /hrxF6ZpJBkczBYT0mKCY7VHT636iZfENkbG8lAk2BQFH6xBnC0LiAF1v8tFbxoihQsK
         cb9uNIiWx1NRWMq7pdfIX55f7YifI/LfY+vsh6rVszQQqfpaz+L8hGWdE80l2DpGO3ze
         V67A==
X-Gm-Message-State: APjAAAUeWnQYpgMKkUKagh9Ip8DUgcnGlBKa0ckFrDyCoOR2F0oDJ61W
        jErqCOCa/8vKOOnU3mGlixLPTl6wEVk=
X-Google-Smtp-Source: APXvYqzA5fmPacS1YAKwVpp9QaRQGmHpv+TSCyYQVP1D0x9/ehnm6bYXQA0uKxkvee0kptVEavA6TQ==
X-Received: by 2002:a19:671c:: with SMTP id b28mr14786357lfc.164.1561078066647;
        Thu, 20 Jun 2019 17:47:46 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id i188sm165344lji.4.2019.06.20.17.47.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 17:47:44 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id r15so3693485lfm.11
        for <linux-next@vger.kernel.org>; Thu, 20 Jun 2019 17:47:44 -0700 (PDT)
X-Received: by 2002:a19:f808:: with SMTP id a8mr2996820lff.29.1561078063824;
 Thu, 20 Jun 2019 17:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190522100808.66994f6b@canb.auug.org.au> <20190528114320.30637398@canb.auug.org.au>
 <20190621095907.4a6a50fa@canb.auug.org.au> <CAHk-=whVBjssws88tSeoVLG5o5ZWXQu=S7rv-0Hd3qt9=VYsTQ@mail.gmail.com>
 <1561077341.7970.47.camel@HansenPartnership.com>
In-Reply-To: <1561077341.7970.47.camel@HansenPartnership.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Jun 2019 17:47:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiprB8PKsFa+VxfSHheGUpWZaAjnqq3KD_M_CMHa4qkMQ@mail.gmail.com>
Message-ID: <CAHk-=wiprB8PKsFa+VxfSHheGUpWZaAjnqq3KD_M_CMHa4qkMQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi tree with Linus' tree
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 20, 2019 at 5:35 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> * This file is licensed under GPLv2.
>
> In all the libsas files, but then muddied the water by quoting GPLv2
> verbatim (which includes the or later than language).

Ok, thanks for the explanation. And yes, that would have likely
confused people who just looked at the license text.

            Linus

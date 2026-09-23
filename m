Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC2B51AEEB
	for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 12:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166857; cv=none; b=GC9/6lR1nJxWV6/ErNIv0NcyHdzd1PJNmj1dhtiHkkLlkPXotML6qteQ48xSQe7U44MKa7J+Fz4RkFRzHADFmrqzAHQlz0cB3rmfHZ1zyJA6WTq+6khpU3nhPbiFGejQs8WV7pRR9BJB5qQYULHY2nmZJy9TbTOMPHin490BzT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166857; c=relaxed/simple;
	bh=dr3B9v0iddAzN+nnrzd/py7hgbR4j0MN2r71CzkQ8V4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIO5nQVVNcuMfXCyIWb9b8dd8izltlcrrWylUJmophUh0m1vp2n6cjnRkin4G66sicHj+XhGWTXHOs3zrAeYH+/BpAIitWNYt8WrYYO8M4P3GOQxPZdKdQSEJWJx363ur6/YwB5VheYMLytnbLBWDCZ0N+rNeXif+BfJ1QYuLVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDlNseLq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDlNseLq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so4554805e9.0
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2026 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166850; x=1790771650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEhSiL9cqS//xo4EeR9yQCOXgVP2pICmibg8gvVxe8k=;
        b=PDlNseLqd3tvMfkbHP0EXk2o2uP6NZVxV7NK+ddTBrV1vnAyn1ZetLn9MIiTTTppF2
         TL92dpyit+XQtxjfJwNrtQmydadx/R4CNDtvEOEjfOs3Lh5ubc4w5NRljggm2hIZ1sPa
         nxojHyz1qmmwEV+g6ypYJkFV74t9z+WSmnb+A6x2A4qqLKPseWEArVyoqgNxLnvxyFPm
         mqp9Ry/cOBTklUYUbR19mb5swP9sJN6GQdr5AcWfrJNJAuk7osd7w+m1i4+HVUwbveNZ
         DOdPtsPof5KJL34In6oKPhEDe/OmA7WWTO8OKfppzQ0jgaDAqDWwqHPNMHmRXGu0jBpn
         Npfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166850; x=1790771650;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEhSiL9cqS//xo4EeR9yQCOXgVP2pICmibg8gvVxe8k=;
        b=jDwaDcHSEBZnNslncE+80BsdlXnvflLiP3Yf9KhN1iXmqsQc4TU/ETm5OZNT1hldMr
         2vBs/G9QZgZCoy7V1wgMxm6ll2fq8MzflvOZGw46imFipuERdOFMxIb8Oy86SmSmHOCz
         ecXz9dJQ7MBtewFrv+uk0CsvM2Ttsw5Ffmc7adMhFmy5P9iCQldpKdWMhbcXB4MEGCVH
         hHVgDg1Ldvrx3r1Et8yYaVpkrus5DSGNvzdVDnZEFRgppUcE1hfEmGyg7TBY92XFwOrm
         dL6hiB5FPHRy6zAgcz1r1H8CDc9BQdhMnTQxCXvPQUa9yThrJUh5/mtHnIRCYd8dEjyf
         B+GA==
X-Forwarded-Encrypted: i=1; AKwUvBx/A6e5JIbu6Ndef31xM3inI975sa8S+3sBCk/Lv0k6NjHY25VLPy7two+bSDTy+ZZscFi/KF7HxfhR@vger.kernel.org
X-Gm-Message-State: AFuF++kkD8YRm0aX5+4p5hnivU4DqiJF9N1oTbsbVMaOAxMLuiiihnn8
	0ZW96EcGlN6nJ1KT7Uk/3/lRMJAj977m4dFiaycqBs9ARkRHrAR7hnZz
X-Gm-Gg: AYBFou2nB1AgFJ6HdIcUOGAe0cI5eYF3KF34+uc9ArvgFVQk16p6+n96tE+RfLTm7ER
	Qhycw4ORV4yeCGQnJvHUdZlr4eX5sMx/jewJ1aXvQv29pqi/ApZJrwJ0UxY0ztCBdGcytRsXhSA
	KcURP1FR4JQeisvaRQMqsfrK5c48ByyqMtmR2QWUsSRZpf3yEvtMJ4cC+uCfb/RuK3+CnHcY8gt
	YWkE0KDHOam3wspzPoj1xKDB/vo1QV8qZ6zTTAWvu4I/WojL7CRQyhpwVTgVfBXWtRlsQ+WgFAs
	pI06sMCs+w7/Bt4NTHvykHY0P1Yg3SZlhIMhN9lG3r6QaYc+Gqz/u7fopl5cXRhpglKBUcbgwkN
	0nMNMwm03/a/MNLdjwHu32GqXfJZnB7uPbnOwSIcC0qasrRvHgCRCSyjUI3yRdhcPZoXYkJys0T
	wqr+iSjeTERcB+xrBJADLDO1nA3LVN0FEeSjeXR4AEqGbysA1sPVXkeyGIBMXTOSgiAGiI+IdfU
	uWaMRr685qfL5WhkrUqaIUQDyKADl9v4jdzAv3xYJfqPA==
X-Received: by 2002:a05:600c:c490:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fdf150fb7mr30227215e9.30.1790166849316;
        Wed, 23 Sep 2026 05:34:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm75405065e9.14.2026.09.23.05.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:34:08 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:34:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [built failure] aicdb.h / __udivdi3
Message-ID: <20260923133407.7411334a@pumpkin>
In-Reply-To: <0aa303bc-d3e9-4670-91e5-8299ddfcb6db@infradead.org>
References: <1ccf42a99c89502a7a5e7038ed2ab2aa5a24dd7a.camel@mailbox.org>
	<0aa303bc-d3e9-4670-91e5-8299ddfcb6db@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 12:25:09 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi--
> 
> On 9/22/26 11:13 AM, Manuel Ebner wrote:
> > Hi,
> > 
> > I did some built testing with randconf and got some build errors.
> > 
> > First error is:
> >   
> >> $ make KCFLAGS=-Werror -j8 > make_output.txt
> >> aicasm_symbol.c:47:10: fatal error: aicdb.h: No such file or directory
> >>    47 | #include "aicdb.h"
> >>       |          ^~~~~~~~~  
> > 
> > This could be fixed by installing libdb-devel.
> > But than I got this error with the same configuration:
> >   
> >> $ make KCFLAGS=-Werror -j8 > make_output.txt
> >> date
> >> drivers/scsi/aic7xxx/aicasm/aicasm: 880 instructions used
> >> drivers/scsi/aic7xxx/aicasm/aicasm: 25 of 37 register definitions used
> >> /usr/bin/ld.bfd: fs/exfat/super.o: in function `exfat_set_vol_flags.isra.0':
> >> super.c:(.text+0x622): undefined reference to `__udivdi3'
> >> make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
> >> make[1]: *** [/home/manuel/skripts/next/Makefile:1390: vmlinux] Error 2
> >> make: *** [Makefile:248: __sub-make] Error 2  
> > 
> > What can I do about it?
> > Is it me/ my system or the kernel?  
> 
> For the fs/exfat/ build error:
> 
> What is the target (x86_64, i386, arm64, arm, etc.)?
> What is the compiler and its version?

What strange set of build options are being used?

> That error usually means that the target is a 32-bit CPU
> and the code in question is doing an unsupported divide or
> modulus function.
> 
> It possibly should be using a kernel macro from <linux/math.h>
> or other headers.
> 


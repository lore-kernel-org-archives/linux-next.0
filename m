Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C43101A7
	for <linux-next@vger.kernel.org>; Sun, 28 Jun 2026 05:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782625433; cv=none; b=GfuEoUoUQ2h7Rsw/6Cq59tOS3sYk3i0XkfG9MskL3awn70aqv1Gqzn2qNnIKVxwr0gRSnAftjqmmrS80i1CHt+tcbxykWZewmEWUdEWxgyZN60JECDLjtj1nWiccJor64dOZ/5ZyLvxMaaj3GbvAGvkXTjT16GMWHWYT3GvR5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782625433; c=relaxed/simple;
	bh=1wxu1ffZs6BxG8V3nUvprTcuFoxDcYcq+uurRJA3asU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpB0QlnxAkgsG6I4rtqj9wOm3nLvy7bHCwosyOyw9ZZAvfFVfY9ed2LMA7I0x10Ib1KrcLra0XfYpA3KzSEyN2SkkjtAuM9N9q5dQHvHRTz1AUWiK/pMW6elea+vZivam3/MNpqjvHkexS6KuZitPXLp9gnKf6IhaeQsEF4FYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF6qMKyz; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF6qMKyz"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-139a5f4ca15so2633613c88.1
        for <linux-next@vger.kernel.org>; Sat, 27 Jun 2026 22:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782625432; x=1783230232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3L3h4tHLQQd+g7WTMFGUMpSSIh4+iDGD72Kmy0ose5I=;
        b=lF6qMKyz9uJh4pCKjTpFhAwpm+rCaMiUUoYa798iX4u5LXbuJc016UJXiIs5i3Q3OQ
         XZfHBUTBjWUfi8kwRP3m8KN+QlL1eta4yb21l0Bc/Pe2ikoYzQqr35IDqSgxhU+v3pPk
         S0cL0qBguon8/QuXzwPIFjPoqcbdWzGL6AQH6tG5dUoOwY77ZGCWni0+TuXCH+gauSVO
         EbyHpoc/VP5pB7Ya65Pu3/1/gp9fm/4LEd1Qthnh3AH/oC/yxvYMvQVNYYhatpE0Kt5d
         qYEOoTA2WObxoMcd2ZWvWmjK2z/GhlxUzpurZXQGhmEGnJqqPC+0S353KnvZDSuV9qgL
         7M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782625432; x=1783230232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3L3h4tHLQQd+g7WTMFGUMpSSIh4+iDGD72Kmy0ose5I=;
        b=foVi/rWL0oTXh2YW5Nx1CkilSJBZITFY7vjhZcwb0x/8yQD720FZQ6qqx3YXT+mk5m
         qaodTpEuspLgrDTiDj1xnscJ94Bjxvtfw6ASlh34UawPh+BRRWlMAHV4bVMQQmZz16cm
         FS4Msj59FPjy+zodbSNLAOHYDKqgGOorlqDp8MZLDhF9YhGtgGZL8Dm0JOuUwTALwQWu
         jMbUJnlrz/6AQhE/cBJSZlO4PNwrVLxdZs+U4QWjiGeBx7/PQj+LqtQHOrpZGwhbQrn0
         VUCsbpYTwo4SrNONe5MF2byryHUZMhd3G1riofWbry4FuPCMHlfxWEM1lk99tA+bX9V8
         4lXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7LMJeDHjaf5M0vIYFMcpiIaSN3+fvfqjIxYCRJu2MdUUjiOhgLxe+KR3njKejVVMEjzes7nALysHD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcusz2B39fuC7Z84tJs4awzkEAQR6/1hGboulFOAM91tltJ1s/
	Fx9gG0CvK9ut6RkyBWnk3BaHTtrEBRsCmnRxxYDC9dFaO/XRDhgeNC/c
X-Gm-Gg: AfdE7ck7K32siBSBcESeR54HhMMkfnvnCliuTBqKWC/CtgVIS1V9zMiivmff2DwJtDV
	O9HzTSTttJYTJZsDA+6XHH3WZUBE60TDb3NEuEHr4mT5YpxTu/x1ozZWQdL+r3PnoiUvTBPPdhI
	/6PVZQRjk6d6pPqoVgK9TBEvYb/S+Xn3RfbSH2G0b8KslKt1uFkQtV6e3K6m6SUGakaNp6uaLFr
	HVwZfom4SAwDbWmgzXr4L+VuhCzRQaMs79YTbQzeikTO+Oge1JovFgYmtTVYo0YbNlhvRNbZ/ci
	PGcBIFe58UlLoJiCYU+2t/+F58Kj6umYXVlFM1zBbxTzmPzQdzV1ruJSgcXgh1xl7BV8dTFd3T8
	xxnKKg+vQu5+e8rkcz7EBM4QFCnM0RuhVTkHb7Lmw9DqvQ9fkcSVvKMb9gt9mkQNrY4FgoRUBF2
	I/AwCVhuhJrrcqCn5/8DYX+LaCNsvidJb210hJ6yheIaUzXiYfxadCvg==
X-Received: by 2002:a05:7022:6884:b0:139:ed59:4b89 with SMTP id a92af1059eb24-139ed594c3bmr4962131c88.45.1782625431597;
        Sat, 27 Jun 2026 22:43:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:977e:876b:dc75:9723])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm15662523c88.10.2026.06.27.22.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:43:50 -0700 (PDT)
Date: Sat, 27 Jun 2026 22:43:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-input@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [regression] synaptics-rmi4: Failed to read the Control Register
 Descriptor: EIO
Message-ID: <akC0hiC2HGOqVwzp@google.com>
References: <de6d34b7-619c-46bd-a6e3-a3917b318571@ixit.cz>
 <aj7saJXgFX--gP_8@google.com>
 <916192e4-7d2c-4463-8576-3cfe9e36faa2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916192e4-7d2c-4463-8576-3cfe9e36faa2@ixit.cz>

On Sat, Jun 27, 2026 at 12:06:29PM +0200, David Heidelberg wrote:
> On 26/06/2026 23:18, Dmitry Torokhov wrote:
> > Hi David,
> > 
> > On Fri, Jun 26, 2026 at 11:09:54PM +0200, David Heidelberg wrote:
> > > With next-20260626 without any additional patches, the synaptics fails on
> > > OnePlus 6T with:
> > > 
> > > ```
> > > [   16.620292] rmi4_i2c 12-0020: registering I2C-connected sensor
> > > [   16.857617] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
> > > Synaptics, product: S3706B, fw id: 2852315
> > > [   16.867324] rmi4_f12 rmi4-00.fn12: Failed to read the Control Register
> > > Descriptor: -5
> > > [   16.867338] rmi4_f12 rmi4-00.fn12: probe with driver rmi4_f12 failed with
> > > error -5
> > > ```
> > 
> > Yes, at least a98518e72439 "Input: rmi4 - fix register descriptor address
> > calculation" is wrong and needs to be reverted.
> 
> That did it for me, now the TS works again.

Thank you for letting me know.

-- 
Dmitry

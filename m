Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD94D179D
	for <linux-next@vger.kernel.org>; Sun, 18 Oct 2026 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340211; cv=none; b=n9tNGIiXQexRpkt05T/Su3If9D2yVqAoFSAAQcrr1B4unwPi40RgFUksvui8kocBOASWO0ouaZVje3Xs5cmxMUvAtW9DIvDTvfzT/iLRp2yYRL242lC7vFkdQpi4WWB2CBWdV/mXpFqOQb6XxMlWY/sv8kqH/hcXGaKn41wTBpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340211; c=relaxed/simple;
	bh=VM9G2IU8S9PT+t8JNTFJvstcuDK+KPuMWkvaCXHk+EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0iFwZmV4F0TP5S2o/X88g4fTcXweyJ2tLyeogw1abnEQ50vAJsR6Qr8BdY6UIzuC60njShhqIdoZJt6sAyxF8wp7d7UTbRhDRPut1U+gzmaapcIQwkYglrcG9vesy8AJxNh8QiKraNENaxsW/IheRHlWuTnVmNAteZOWeXV/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6ih1d53; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6ih1d53"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1198694a91.2
        for <linux-next@vger.kernel.org>; Sun, 18 Oct 2026 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340207; x=1792945007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc33dIGb22zLmtwbw3KptWfTKOOxa38o0ahhhSVqK7w=;
        b=X6ih1d53PVEJvbbmmi/ZO/JmJT98EAkZa5irOPMZ3+2ygBy5AiSj9846h3KmqXWZvy
         kCZvhAZbkkkacRs+pwgZE/UmR9YJYDzWT8ORtni0e4UXEgmxuHj9lOs5WgIb4HHaxhMb
         nJrTKpNotBuY8BmahWGthNemUeqsgR370/aErrsB2uTct4GCT4y1RhAuzXAULZA0zWyV
         CQtQxNasqHF6gPsckq59IiutRmi80QsRCtsGH4Sh07bptPJx+SZy4lj7tLqGhOadl4+2
         oDxr+5I6oJ8vqk3qyz4JPGh2Zuhi18S5yMFjDrQ+C8GfaaWwULo87Osyfpt5cBRom6Vh
         bHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340207; x=1792945007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc33dIGb22zLmtwbw3KptWfTKOOxa38o0ahhhSVqK7w=;
        b=ZUBZHxNNjPn0gySZq/n+R1n60/uWHCFTVRon5Ue4jdmDpaMD0DGAyOD9WGabdTqPP5
         1Km8XoqJhyXDxVSFpsPqTY/1+0gbYflnXEbthfKmpNsDjZPSMJqedYflqpNpJ3tFxkce
         s5mC8Kijp1c31JPFOVF9TcXM8eVI4aKQ9r0iiUMGCUr68H8oStieFDQlg8A5wNMrPy0Y
         saYAkvOHN2HyJorb/k/9/ODS4tWo/YcCBqZzbahxyvpSxcprbJk1LG11GYkApHal0xvi
         mKo1wwHcqXXJAv9Km3Bu/fvV6dNdcznN/adjvCUCJ5QL2OPu4bthcLpyofMWKQ8cpJ07
         egKw==
X-Forwarded-Encrypted: i=1; AKwUvBykQ4nt3MkVs6ovRD5PKytULsBt6rxVry2GoleeyFRjZ+CKu6hdj6QhxqRMp5yM8afgWp3K7w908fYX@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1k3ivJv84UKUGeTtff0hYizup2bDY4kJlKP01ac7EB2y6fYaF
	UPtsHhP8tne0JqWGD+v0GYDoHOaZZ1NgQH+G3YEwec4tzQDaqD/gHtyW
X-Gm-Gg: AYBFou0p4tGQRvZsiwOLnjOiDQUCtrsNY4sVQabUE1X7D1psH9DdYyE285sdlQqD9Fl
	KeZYu0oDks/R91rUrbnxTu6/GZRfkma7MRrehbPwptMZBtxkMMiIMLWP7D7GOkEM4Fzq6Yl2TKv
	9XNXGnVLl+oUWDae1iSvLgd2r8bU7n9ssolol4YMCqIp1pBUkQlYgkfZtw1oTvvXXJY8mV6jl+b
	uU00+xZ5X6Fw3f9h+1MqMbTmE1ZQVebcz4CoKL1iESewicGyAVzao4GPV1PQgASP1wtYbIC5uN7
	gbcRpII31NQVUn4RuuDmbdB9d9IBoAO7YrD5JOIiEcUwApAzLAcvp4PuGr8TpBfwzYW96uYHiIy
	d94TCCy/DWAjXXfp1SxwdRwn+7Oq71rk3xxkUZ2uUGlDWjBfGZwsi9/1M1A4SW6l07cp+2ohO7R
	3+2EbDEuPfwWwGYiR2LIgM5HkbIvxNGrqwT+mA0DwJctyQ88bVPpdLTJkKt5fbsFmBbzmuRzTW9
	SHvjcm2Vv8eNU1f2FjHgQs=
X-Received: by 2002:a17:90a:6082:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3acffb826b6mr2070104a91.51.1792340206761;
        Sun, 18 Oct 2026 09:16:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4972fe6sm12471343a91.15.2026.10.18.09.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:16:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:16:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure
 with GCC 11
Message-ID: <2bffbd3b-391d-492f-959c-fb9128bce49b@roeck-us.net>
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
 <20261014214522.243253-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014214522.243253-1-speyrott@gmail.com>

On Wed, Oct 14, 2026 at 06:45:22PM -0300, Sebastián Peyrott wrote:
> GCC 11 fails to build the driver:
> 
>   error: call to '__compiletime_assert_727' declared with attribute error:
>   clamp() low limit 0 greater than high limit points[1] - 1
> 
> The store function returns -EIO unless points[0] < points[1], so
> points[1] - 1 cannot be negative when the clamp is reached. GCC 11 jump
> threading, however, duplicates the clamp() limit check and does not prune
> the copy in which points[1] is zero, so the compile-time check in clamp()
> fires on an unreachable path. GCC 8 to 10 and 12 to 16 accept the code.
> 
> Select both limits first and use a single clamp_val(). This does not
> change behavior.
> 
> Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop
> Assisted-by: LLM
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
> Tested-by: Paul E. McKenney <paulmck@kernel.org>

Folded into original patch, as suggested.

Thanks,
Guenter

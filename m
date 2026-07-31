Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B803FCB2C;
	Fri, 31 Jul 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500921; cv=none; b=QvpD8hN3v8R6FOKwJ7bxpQXwR3Lw9KrEFlO7jcjUaGjEOcpC0de7u8/EcdzS2PcovjPdG2cYt1Jz++djebbZlg2QzeTbbXY7nsOISBqskFBPIj4QA9Y0r4rQX66xwmefXLPypnT73GDtcNgQoD2jkgIvjwvBq8q2+rmrMPu55rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500921; c=relaxed/simple;
	bh=5QaQ9J+b9ndM27kcRJgnV5FE+0nKYXYWgHKy/sUENPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tqt94iDpzEKTUjt3JOzcDPhZmIlKICUI03TBWIseYQqjTZrf9T4ntZwDbqAOP4/rBk0OC4ur/UkUfYAyXMKHnaLK6Im78ROPs4hMwSaCMgNe8zmYxB+eHMAviZUQdvVStmnwPLcCnpZ/I1bBll7RgtAXfxXZqI7Nr4pCupv0ieE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=YyP8ul/f; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="YyP8ul/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785500908; x=1786105708; i=spasswolf@web.de;
	bh=31JVUoYZr2JHZrTN3vwKGoX1a54nvdb79uyK227btA0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YyP8ul/fkX8RARiyZClSlRFbioVwRtuLOWzloPxqxL5K+ZdwjFSGjEkPyHhk1AUc
	 TOBXe0tzk3XFu0ZH9V7xvZzQ25Pa4DXCqMr6bGHGCC+4hoRtBlzhCGgKJA4geaHCI
	 VmEq2RU5h5L9bTnxXmS5bQqi3ypx5dpJyk5gsm75eV6d9BNFqPp2uxb2HorfZM90i
	 W0Fd7c/u/tkg9kXXkEt3NeiXJJtFBCQKsTiQvBG0ZvZ9vpbXmM4vB5if8HfxPXdHA
	 eyc09dJPjfLODZrCK0QrRFOZvTooeMyuk14AptOWf+S9GvdzjHk8EVsat9cec+7yN
	 mXZrnu06YjoaCWjdMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MAtsj-1wf6A64BwH-00Cyiq; Fri, 31
 Jul 2026 14:28:28 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Harry Yoo <harry@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Vlastimil Babka <vbabka@kernel.org>
Subject: rust compile failure in next-20260730
Date: Fri, 31 Jul 2026 14:28:25 +0200
Message-ID: <20260731122826.737703-1-spasswolf@web.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qj5MJVK4jbOQo8AKPsDAPcZWpGTivkdoxfouZVqQ9WDla1yruxg
 Hexf5qSEk8c1QnvRrfJF+lA9MlnJB2ubuEeGlJuLkWKpVOuXF1xbjgb4akC9lnetOYBhXzV
 gWUFCzaOanmg2vzbUb6pcX2NURApRaou7c8rNMie7uaKe94sQweCZFssRCDS3KCACaFPuHQ
 AAQBGbCc/hEd8WtdXW5mQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wk4MaJAYAjs=;0lVZ51nSRjfRioQYbVtCzRz3nCw
 Jo+3UZ9dAWZxvsvqeWPFBT5+Bdy5DDRvYPKLe3Zh4tT9WoxHpGCPiussH4tVbX4uQLdTbpz+T
 HzJjOD7lNYf4drZttkPPlzmGpnOk7zR4XLX5MEJGCQzQSdjvKGzp3ebSbB4oI+tqKGbmpf358
 ofKHlprER9d8+z24HzekFl8YV6W3oY/Ynr332kzh8kKYBEbmzeQB0Ubqa/xlwEkwOusQLVROT
 zaorKUBoA6u31dLt38y+iJR08CI4u7mzPP4glTaX+i6/IZX2W7f6w2j54O3B0aU1fRUxcedwr
 7tv2O5j/Kv3j2Xda2r97Bg2rVyy33SUVob5tda+557QLVSwHOF0d1r+7BuxpBeIZHdnPS9u6V
 gsFiF0E543dm6eCagqWQrP3Y11haubhuqgO6QhVcg07Vn304WqNeP8C6eTE1jQvE2BiqDod6x
 gRDuRLDlJFSKlRJjBEkSnQmtXqpSMN34jM6tW2QmI6CcjjGzcS5FTwHhFY1IzO8DZ7xgukH3M
 Ql0Z2XFQ0k+mmECKAq1mLKBTDlj5Vvv7N89NRBpFSPrSb8q2ZX0IU1BLXgmwJX12hVAS0tZpW
 cGoFvduCAO+xcsa97t8fuNfhxjPvIvXLrgVaFNqGxDzm3S3g9/LQMyrx+MCdf5QeR1GSWM9w8
 k6AWkd71wF+Q5r0KvM/9WIBKp9PaUxt3STI3SEZ/dyl4p7cNhcCTe2u5kewKgJfkWE7VLpxrh
 L4XZaw9f4wMqrjpokc4/HOEZAGkECzikElz1h1Ok//JBNyuz1hU6HPgqcvYUj75lPYy+1D3Qx
 PXduOhKnmMDqQ1wvTfFT8058pIdGqyo+OuiQjN8IpzlNtsEGWvi3roTMWrnJwDm15LjYA54qB
 AEtckJeOWoAaxcUQk6LIV5QlijZGm3jOLLOr+3NMVYkQADviwJWH6/Jx4jW0OdD6oxmIOWqbQ
 p3t54d8NCv5X6+Zuz7mjLnYiOEmvEqZXMuI7OZxJy+iI2KuwiJXyNKtSE1Pze5+rjuK08VQ41
 h4aNoRyfvlaIA2evpbjtI0E52GB9PueMeuxWZ+m33a3iFZl3lciquk6CF70IzKiIQjpmi04tB
 guRCywX5/DVNCJEjyzzKDDV1rDiazfLPUzJVEP9bdeuM4rq3n2mVuyZepZM19+EW64sQFh8bI
 AhZyw8xK4opKktCzuRXtfi1MfisNKQz9Qwdb0I0hWGJV+Hh9JaFBSgPXdq+tYVcsxo/OYFJYw
 K8djH9ECeGGcNBuM+RYJqPNfbz4JE1isvylupVG77vZ1/ttxbDKGClOsvxdW1pNby9x12EF3D
 Jk37tClakAVHd4bxpODAQF1seWgEmTAZoKsxAB/1KUUw5dsaICX4csWCjbsofGLvJhTDHFXHZ
 INWARgdl2KbzWLxv8O7tO9tAHr05eAOswrsZhQ5OCeeFjN55AoQtRjw/kYi36KbJQdH1LPFdT
 x02B77tvhmV0Vht1JMLNGYmMLLHNtx5G59VqllaCReQtfZOUz4ejYe7ujCZwsIg3ydYdHO/+u
 JNW3VulCIWxSlmZJN9osoVi1YtjQzucQmPh8hTAaUdbB4TSzJjwtFPZEJeb0OBj1eb4hFA2zm
 VwTQUEzvNDqnnbOqgPouZ1pBpUrg7NSo4Ah+YMTKcdsip4NuCSkt+2UpJJoDF/f0Yhoeq4RCf
 Lv1HRU4shZ/7FbbQRTOvq0N7wkk7E1IXwqCg3iDNun5EfG/mWVxHpUNszkQVlhCT5dQRCIkx5
 J6SRzJulPAvDUohQvKtLJQPeJTUMetXnIXW/vCKhjN5tLaDAMqkD6OzTTabZCHFfXq+up/m5K
 5MiwkGYSwrZKfhhwyRCxu04rvVeRvpBj+R9UnfRE5b0tCdffdJv/yCuIcx7bj5i16WRaQEKY4
 vCqmO1HQdBwcgtuCW3KXB5gTHPrUwHxTOzDTd2DyiLUFE5pfArCE4KRmvkdRIkCjuMx00ERnN
 tYr5pYhZYR+Xx+iB3mDoPWTclrhGi/JMjBLHuWY3exs6aTfGlb4LAZCnojFTEzdNTSzc5mmrw
 Nm/UtkzRKXVHibRzhXcY4EdQJJR3ApHFCUtpoRTef0dpSbG+byFZKgcusqHHt45ppsNbhBgBJ
 7FBBHFU0YjBofsUWrqXX1UO72eZ1bKqYyeJFh7SOpYOfV2PPTJdm8cQE07ivnMzSoIajW1tUF
 18Vi6sXWfGKAxsuFr8AwXHPbR07sLVwnD+Vcv0zgItgWDw5UGjLYLZ81Fda9uYXH9YOruKAeW
 GjMK+KiRMqHjwRL6ZHRvKoWO+BDPEDr2BN3pxnpPGF/2tjx1Xzdkx/k/JW8OZ/nH3uXqJNzY+
 MhhPQs0PfKOms9Xho5zrjiVdWiBWCNveAhuym7neUvCP4OzJQqJ165rlEdqYX5GR29fFuIACa
 ZhGinbmwWF27s4thDEP7+eaoMHUMlpjrc2691Mph2ZtJQA/AX2/0uH+Oo6Y8260ieno2pyy3R
 Iv+mHeq+Rm+Y+9FSZKSGQFN7CmOPMNi/RIfbT4N+jujMZXvv3wkDDFtJdKYN1/cgbz4CYYEOD
 mJPXrTXe06USeCcGIJkJQQu5HJzx3XOoxK9daIwM3VqJH2qFQFGJutosLcyh2ZS+D0rWNxZRv
 DJuUf5cNTpZHdDeGuw/7hnntZRMxkoVt4qOYKHAbiHN46o4pPPmO9Jj8Nx9CeDfSMGmT4TLPV
 Q4jggJiChcUs5JX/gTftqste9N/3/wU+Zgsw/gnQSAmtT79oOl4XrvT/GxSkTAlnalQvd7yYs
 YhXEGdchxWJ5kbz5qQQMP6ikdORF1PEfCG1F/Dt7r12Q6jpH0or5d/lQ/fLoUe7UW/3ato009
 3SzGKH8382bo7O6V67Gk2Ks1Mf3iz6/z1HP3qQhWqaO2Qvc3JYhWG+5IUc7NM6zdVW4/YlIvK
 k4XFgGFGz9HGOTzFmHM1GIT8Kr2bHRNs/lDlmKOYAedqvGQKmEn8Jfw+7t93+mSFh7peyY65y
 tNSXg6SpNlM2epZnSTk5NmL8K0YzuJfIIO7gWcuLIx0vI75npE/xjIn7dfaDHL/V6qSqZiFY5
 oLnKEc1Os/SxZ0kKVLDgUv+vMKC41hWmQAaK+PEqVwmxYuEwrLvkFnHMNUXs0Rt8z5LH6c33X
 nI4kOV8L5kWkSyn331O+A7ZqxMEyrSFCNE68A++dZ+M1U5t2AcRNf57rb5XwrgfgWAm5pSaJF
 hqE3oq0hKuH/Tl1LAyL2igBZp5hgZhdmb23aKPBszWrTJvbGS42ELKcCS/yIr5n/AJgcdaCya
 eI4RTerV6tJ/ZTp0CYgozdWBDmRarPc9AbbPKfZ3Kqx0ypKRq5hjAmXmCLwG5Q9xvVfp1hs+4
 GeuFLBxVvajcN+lRIgVTCPANXCjvHE+sXeOqpkP3TXKSwwPxb4IvAvwQteq/PY8hnphGK4ujT
 d3p7/uxU/G9BndP9a9g/7PkpIdEQhezDedYAnR6LnJx46wPEZWL+L/IT3iJJJ3y3vEJV3RfiG
 o3ZBguwNLzFazeHyIpqTCMUqlxfRR0ylGRhA30Xd7YbdIp+TgqZTFnE0kWc7yFIEwd5AHwuJo
 6CjH2yC4ZoIOZTwCtIWZ2ydXjhA3OPoViFlKVVEvOrNM+obv8/71NRakWlHJHH7KZyGXzNI6H
 c2K4UF8IO0r8sn7HTvmo7wq7ArMk0zZ/m3UPZJTl6Hi4kcy2NYmHlpS8ZjjpoHgolcYq+Ntbf
 dPdJYkZAHPNBEdXG9bwJSv3ElbOID4ZZC5gUdKX3oMNpFaP/L9Vc0xUr8TTGQp86m0O+a52/7
 M/czH8cxVbN9Aibn7DguijkqZls+nobdgK+076XiXDhX+j0ryzleFhYLUEM2w27adcyiYu10L
 2Dw9k++1QhlJtD4grBevLI8tVFSsDfUC9tl3dP3Gm/mkRHxfHZmjZ1UvYap/OHe2RKg/D96md
 RlQlTV/eFIBmlEWRsU5wzCP9u7UtfZLrX7d8vWOb1Ku/zOZVVYgQWns8jtE8/2Me1MtUMz7mZ
 t4P2vjtdiJzA6if/Hyow1FNKoCl/hHyzPCk4g+1W9we6jhYaZH9fS8h3A6nIg6gM58W8/ur7T
 pJcgb8nOGohR2Y6WqqYadAd+lp4o5RZ/0lF/KXAHN/nf9LyFephtCZD/v8DX/ZR47UQk8ZEUx
 9pvQ6xflcK06iA9daUMaQSF6Io0VlQkziuoQ9Od1e7CLBisoVhRFUldQvcnhFNvG574p34RRl
 Z6IKFMVB3JJ9FfApsmwkr0djQxn2D1LqMq8pohOScE4nWEB1Cd7uCJnUSVpG6ooL3MTz8daY3
 P9lZsFYjBMTfml+VpG0TZslNkr8t8n8IIL0qJLRGQa5I9qYf5wDTKZXTpTk16uz1TxSXtCvZX
 rXL4fNY3DrDJv7guJLYoK8XapNP0KxhRZw8QPSqqKGLdpt6/lxkHlsFQfNrhfsBF9sNQQRH8D
 wmWLoRYZWge0MujuD3PmPKgNFBcUdPjYES+Gpxzku5DDmhkkFt3Gj1PCLF58VyP9103WfoO6L
 6iIXsQKMnkwVMeXkmRArd3IAArRv3hP/yOKEHJDboX3u1HayIvgVxC4hlkvGAGelbMm2h4Bs3
 DDaUSkPxpfHXZHb4z3+msbfCfLT7jb3wGlZjQ41RGnZftq9cGelef/T0XNwov+1xhJJyBaokP
 CxRtVH8lVTjWUdv8e0NI5EZDmvHQaxy7BR40gvL6vhs3ATSHaFjBhnssxufEXg0MhgaGSj52t
 Hg3mJHSMr5/JDm6xwk5vN28AAtz3p8xk6jpfs10UAIQWPJQ6cUdgLqlAVLC1DCdgILJL1f2oN
 48PhZR30w59GhxGCMt961WKfDvV6FdDNOPQhOApdflz9dXJcyv98lSKqJN8POwrmjr1qa1gQt
 zHTjm5/JOKus3SCHS+FFmMdjgPJ59kpa+GWhiwzOmSMw1WApUNkQF34lsiiYo6jGDiGyz4xJW
 YHz91cMZowp31tvOC4k1wIVBsS1byzcxA0gxMXayicuVuRgpcValJOTFWv4pIOGMQmzR3pC+q
 SlKR0H3JpvQ11hWqEEYL0oK2zK7Q9dvuAxeRNM0w5HLrhEjIjFLIZNXx9MbHX1/AuoT49YenK
 2J8w4ObUFHIZ07aFlGTO+1Ymc0JKTBla27BLaAwqv8/H+EIKccnsFJ0gBP8KbdgtavEQ+seiP
 XqucAXHf+i8K4+g4ogHdz70nZEmV4NwM17sYqJlsMMwvMMIDpGkfxwJf9Dg8ilLwZJfMWmhuT
 gV6St9bL+YJF3lOV8vtloyDYsxfafHoBXsLmOzUELt7umCmSWrkKOtcFnrZbImY7u+iKy0EbQ
 JPEc0isPV58+aPl+wQPSzmLaV4K872BTeG6KzwCgyY1L3Hq7KejWDxKYBGrGeWMEk4mZi/7BW
 4qw4kl+5gzVuVoITl0pGccVYbfVtFqKbbYLoe7ecNkCNHx+pY+snC8KtEPrAZkhmjccKa6kMw
 W8Sf+O1h9H0sUSJxMoqYQsLA5e3atd9spGniUv665GjQ9ErCOyc5noIhBru2f+5BygsQOKrSq
 D0YJuMpchI9SNbuBaVQuzPpXZo28nWSMaINdUH0ioleXBKfmJNG3wTZXhZR4qb79Ha41Gvn8x
 ywFV7orOAjpr2WHpTIZw1US8bb7SHIH1sCT8tdPFY/GoqSImf4QvoFj3wPk1LggI2WUuF4IPy
 2yhOB5WGgrLnHc0jsUgKSh57uaBY5ds/ZR+I+Vmh3J+KTZUS3btT7mOpDyqDQuNGuHnacvq5D
 n7eU9okYaJsBhTblmfQxT4MbQwvF5P1zo/Jwo5lbqw1KevTLcdmuT8GUw2RLZHRIoPUwYk+Ip
 WLYaFzvVPmOAlaPaNPtz8I7BEKY8iHTgQOuasE76WZQ==

With next-20260730 building a kernel with CONFIG_RUST=3Dy fails with
the following error:

 RUSTC L rust/kernel.o
error[E0308]: mismatched types
     --> rust/kernel/sync/poll.rs:175:44
      |
  175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.c=
ast::<ffi::c_void>()) };
      |                  ------------------------- ^^^^^^^^^^^^^^^^ expect=
ed `*mut kvfree_rcu_head`, found `*mut callback_head`
      |                  |
      |                  arguments to this function are incorrect
      |
      =3D note: expected raw pointer `*mut bindings::kvfree_rcu_head`
                 found raw pointer `*mut bindings::callback_head`
note: function defined here
     --> /mnt/data/linux-forest/linux-next/rust/bindings/bindings_generate=
d.rs:73708:12
      |
73708 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut f=
fi::c_void);
      |            ^^^^^^^^^^^^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.
make[5]: *** [rust/Makefile:781: rust/kernel.o] Fehler 1
make[4]: *** [Makefile:1420: prepare] Fehler 2
make[3]: *** [debian/rules:80: build-arch] Fehler 2

Reverting the following commits:
ef32a74f8f6a ("mm/slab: introduce kfree_rcu_nolock()")
bdd0cc9f0ffc ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu ba=
tching")
   =20
make the compilation work again.  =20

Bert Karwatzki

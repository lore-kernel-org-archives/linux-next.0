Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3248BA3D;
	Mon,  4 May 2026 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921377; cv=none; b=d0iMF864U4y/7i86Kep3x7H6wKJtTm4uB7sSxIILo8/MZVmpJBOHHcx2LuHcJ+5EOtmhu6YgmYxUJAImf4uXqn7JixafUBJUk7KtnBABVzXEQ4LTGs9vSM8v6mBbdElKruI4/IsmfDJLEl3d7i+5rPHT/rvoDzaFqTq17TbnbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921377; c=relaxed/simple;
	bh=0I063VSNOLhF+bJatlO1a6CJZNiPJpt2VeHW8S4ElD4=;
	h=From:Date:Message-ID:To:Cc:Cc:Subject; b=jN+gF2qVePjTyno/KnumT2aw7+A/OiIV1sEFtSevK+DWzpPM3LUksgYgH1TpmNcNvtYdT1DAu6uptiEstVuk+cX27FFxb+g7RgC2kVqd4pghCP9AkHGzEXyvqRlWaC9j3wl+4nigW+CWIz1Utn+MiIiFQSL8FO16VJXMVIqDY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j98102xI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j98102xI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC99C2BCC4;
	Mon,  4 May 2026 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777921377;
	bh=0I063VSNOLhF+bJatlO1a6CJZNiPJpt2VeHW8S4ElD4=;
	h=From:Date:To:Cc:Cc:Subject:From;
	b=j98102xIAESuCHlVHc0owh0ujtssA81OsBPiyq+OEjbh6T0hGpvxG5UiXUqMJE1Wo
	 QjdK+4MQHIjrLA66eWvlFygGITaeZdeaCzbPTTUa0aZpMZkAAnNFDOGmlzTuZNH6sl
	 vf2eAyWtUQymvniuJR/iPGxn7mA4tv2weBZ4HzTrhqDep6qATksZQ5hoO2XlnHaS0T
	 Y6nPuJqYRJlUXNv6uzAcfQ1VpJ3ZCOchZun2Cphe6yxoefs3zayrPzh4qY4gy8hG/Y
	 tyncfoDeQ+4aobzYn33OojL7HKqECOEvGL1Ia+crxP1rXTzYif+4Mi/PnwyCAtKPcF
	 JRVVmCuWTDSmQ==
From: thierry.reding@kernel.org
Date: Mon, 04 May 2026 21:02:54 +0200
Message-ID: <a28f8b6c855b7bb1bcad356189700c6f@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org
Subject: Missing signoff in the ntfs tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Commits

  22ce4408ff42 ("ntfs: capture mft mirror sync errors in ntfs_write_mft_block()")
  4c6e800ca64e ("ntfs: redirty folio when ntfs_write_mft_block() runs out of memory")
  6eac7c363345 ("ntfs: use base mft_no when looking up base inode for extent record")

are missing a Signed-off-by from their committers
